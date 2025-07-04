import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_sprints/features/auth/signin/presentation/controller/state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.session != null) {
        emit(LoginSuccess());
        debugPrint("Login Success");
      } else {
        emit(LoginError(error: "Not Found"));
      }
    } catch (e, ex) {
      emit(LoginError(error: e.toString()));
    }
  }


}