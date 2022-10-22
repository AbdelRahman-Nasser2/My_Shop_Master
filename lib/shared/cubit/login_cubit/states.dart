import 'package:shop/models/loginModel.dart';
import 'package:shop/models/signUpModel.dart';

abstract class AuthStates {}



class ChangeEyePassword extends AuthStates {}




class LoginInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends AuthStates {
  dynamic error;

  LoginErrorState(this.error);
}

class SignUpLoadingState extends AuthStates {}

class SignUpSuccessState extends AuthStates {
  final SignUpModel signupModel;

  SignUpSuccessState(this.signupModel);
}

class SignUpErrorState extends AuthStates {
  final dynamic error;

  SignUpErrorState(this.error);
}

