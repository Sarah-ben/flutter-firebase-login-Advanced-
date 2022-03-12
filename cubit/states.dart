
abstract class EchatRegisterStates {}

class EchatRegisterInitialState extends EchatRegisterStates{}
class EchatRegisterLoadingState extends EchatRegisterStates{}
class EchatRegisterSuccessState extends EchatRegisterStates{
  final String uid;
  EchatRegisterSuccessState(this.uid);
}
class EchatRegisterErrorState extends EchatRegisterStates{
  final String error;
  EchatRegisterErrorState(this.error);
}
class EchatCreateUserSuccessState extends EchatRegisterStates{
final String uid;
EchatCreateUserSuccessState(this.uid);
}
class EchatCreateUserErrorState extends EchatRegisterStates{
  final  error;
  EchatCreateUserErrorState(this.error);
}
class EchatRegChangePasswordVisibilityState extends EchatRegisterStates{}

