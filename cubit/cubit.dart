import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echatapp/models/user_model/user_model.dart';
import 'package:echatapp/modules/register_screen/cubit/states.dart';
import 'package:echatapp/shared/network/local/ache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EchatRegisterCubit extends Cubit<EchatRegisterStates>{
  EchatRegisterCubit( ) : super(EchatRegisterInitialState());

  static EchatRegisterCubit get(context)=>BlocProvider.of(context);
 // EchatLoginModel? EchatLoginModel;
  void userReg({
    required String name,
    required phone,
    required String email,
    required String password
  }){
    emit(EchatRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).
    then((value) {
      userCreate(name: name, phone: phone, email: email, userId: value.user!.uid);
     print(value.user!.uid);
     emit(EchatRegisterSuccessState(value.user!.uid));
     print(value.user!.email);
    }
    ).catchError((onError){
      print(onError.toString());
      emit(EchatRegisterErrorState(onError.toString()));
    });
  }

  void userCreate({
    required String name,
    required phone,
    required String email,
    required userId,

}){
    UserModel userModel=UserModel(
        name:name,
        phone: phone,
        email: email,
        uid: userId,
        isEmailVerified: false,
        profileCover: 'https://lodge-cdn.ammunitiontogo.com/lodge/wp-content/uploads/DSC07910.jpg',
        profilePic: 'https://th.bing.com/th/id/OIP.Kd7g7Z4lWMIBILeybizhrQHaF7?pid=ImgDet&w=640&h=512&rs=1',
        bio: 'hello world'
    );
    FirebaseFirestore.instance.collection('users').doc(userId).set(
        userModel.toMap()
    ).then((value) {
      print(userModel.name);
      //CacheHelper.saveFata(key: 'uid', val: userId);
      //print('key is this:::: ${CacheHelper.getDAta(key: 'uid')}');
      emit(EchatCreateUserSuccessState(userId));
    }).catchError((onError){
      emit(EchatCreateUserErrorState(onError.toString()));
    });
  }
  IconData suffix=Icons.visibility_outlined;
  bool isPasswordShown=true;
  void changeVisibility(){
    isPasswordShown=!isPasswordShown;
    suffix=isPasswordShown==true?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(EchatRegChangePasswordVisibilityState());
  }

}