abstract class LoginState{}

class LoginInitial extends LoginState{}

class ChangePasswordVisibility extends LoginState{}

class LoginLoading extends LoginState{}
class LoginSuccess extends LoginState{}
class LoginError extends LoginState{
  final String error;
  LoginError({required this.error});
}