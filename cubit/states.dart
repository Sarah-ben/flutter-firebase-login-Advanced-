
import 'package:echatapp/models/user_model/user_model.dart';

abstract class EchatLoginStates {}

class EchatLoginInitialState extends EchatLoginStates{}
class EchatLoginLoadingState extends EchatLoginStates{}
class EchatLoginSuccessState extends EchatLoginStates{
  final String uid;
  EchatLoginSuccessState(this.uid);
}
class EchatLoginErrorState extends EchatLoginStates{
  final  onError;
  EchatLoginErrorState(this.onError);
}
class EchatChangePasswordVisibilityState extends EchatLoginStates{}

