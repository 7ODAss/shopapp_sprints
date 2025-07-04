import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_sprints/features/auth/signup/presentation/controller/state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isPassword = true;
  var key = GlobalKey<FormState>();
  final supabase = Supabase.instance.client;

  final domains=[
    "gmail.com",
    "yahoo.com",
    "hotmail.com",
    "outlook.com",
    ];

  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(ChangePasswordVisibility());
  }


  Future<void> signUp({required String email, required String password}) async {
    emit(RegisterLoading());
    try {

      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

        emit(RegisterSuccess());
        debugPrint("Signup Success");

    } on AuthException catch (e) {
      emit(RegisterError(error: e.message));
    } catch (e) {
      emit(RegisterError(error: "An unexpected error occurred"));
    }
  }

}