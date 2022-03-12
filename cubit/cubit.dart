
import 'package:bloc/bloc.dart';
import 'package:echatapp/modules/login_screen/cubit/states.dart';
import 'package:echatapp/shared/network/local/ache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EchatLoginCubit extends Cubit<EchatLoginStates>{
  EchatLoginCubit( ) : super(EchatLoginInitialState());

  static EchatLoginCubit get(context)=>BlocProvider.of(context);
  IconData suffix=Icons.visibility_outlined;
  bool isPasswordShown=true;
  void userLogin({
  required email,
    required password
}){
    emit(EchatLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          print(value.user!.uid);
          CacheHelper.saveFata(key: 'uid', val: value.user!.uid);
          emit(EchatLoginSuccessState(value.user!.uid));
    }).catchError((onError){
      print(onError.toString());
      emit(EchatLoginErrorState(onError.toString()));
    });
}
  void changeVisibility(){
    isPasswordShown=!isPasswordShown;
    suffix=isPasswordShown==true?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(EchatChangePasswordVisibilityState());
  }
}