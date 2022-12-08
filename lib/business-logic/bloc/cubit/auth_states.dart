abstract class AuthStates{}

class AuthInitialState extends AuthStates{}

class LoginLoadingState extends AuthStates{}

class LoginSuccessState extends AuthStates{}

class LoginErrorState extends AuthStates
{
  final String error;

  LoginErrorState(this.error);
}

class ConsultantRegisterLoadingState extends AuthStates{}

class ConsultantRegisterSuccessState extends AuthStates{}

class ConsultantRegisterErrorState extends AuthStates
{
  final String error;

  ConsultantRegisterErrorState(this.error);
}

class UserRegisterLoadingState extends AuthStates{}

class UserRegisterSuccessState extends AuthStates{}

class UserRegisterErrorState extends AuthStates
{
  final String error;

  UserRegisterErrorState(this.error);
}

class ChangePasswordVisibilityState extends AuthStates{}

class ChangeSelectedConsultationState extends AuthStates{}
