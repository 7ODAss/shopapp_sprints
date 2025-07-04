abstract class RegisterState{}

class RegisterInitial extends RegisterState{}

class ChangePasswordVisibility extends RegisterState{}

class RegisterLoading extends RegisterState{}
class RegisterSuccess extends RegisterState{}
class RegisterError extends RegisterState{
  final String error;
  RegisterError({required this.error});
}