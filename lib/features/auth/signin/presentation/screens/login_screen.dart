import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_sprints/core/shared/widgets/mybutton.dart';
import 'package:shop_app_sprints/core/shared/widgets/showdialog.dart';
import 'package:shop_app_sprints/l10n/generated/app_localizations.dart';
import '../../../../../core/shared/controller/cubit.dart';
import '../../../../../core/shared/widgets/myformfield.dart';
import '../../../../home/presentation/screens/home_screen.dart';
import '../controller/cubit.dart';
import '../controller/state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ShowDialog()
                .showMyDialog(
              context: context,
              msg: AppLocalizations.of(context)!.signInSuccess,
              title: AppLocalizations.of(context)!.welcomeTitle,
              color: Colors.green,
            )
                .then((value) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false,
              );
            });
          }
          if (state is LoginError) {
            ShowDialog().showMyDialog(
              context: context,
              msg: state.error,
              title: AppLocalizations.of(context)!.loginFailed,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.deepPurpleAccent,
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.language),
                  onPressed: () => context.read<LocalCubit>().toggleLocale(),
                ),
              ],
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: cubit.key,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.welcomeBack,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontFamily: "Suwannaphum",
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.signinToShopCraft,
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Suwannaphum",
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppLocalizations.of(context)!.emailLabel,
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontFamily: "Suwannaphum",
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        MyFormField(
                          controller: cubit.emailController,
                          text: AppLocalizations.of(context)!.emailLabel,
                          hintText: AppLocalizations.of(context)!.emailHint,
                          isUpperCase: false,
                          type: TextInputType.emailAddress,
                          prefix: Icons.email_outlined,
                          coloroftextfield: Colors.deepPurple,
                          validator: (value) {
                            final domain = value!.split('@').last.toLowerCase();
                            if (!value.contains('@')) {
                              return AppLocalizations.of(context)!.emailIncludeAt;
                            }
                            if (!cubit.domains.contains(domain)) {
                              return AppLocalizations.of(context)!.supportedEmail;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppLocalizations.of(context)!.passwordLabel,
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontFamily: "Suwannaphum",
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        MyFormField(
                          controller: cubit.passwordController,
                          text: AppLocalizations.of(context)!.passwordLabel,
                          hintText: AppLocalizations.of(context)!.passwordHint,
                          isUpperCase: false,
                          coloroftextfield: Colors.deepPurple,
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock,
                          suffix:
                          cubit.isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          isPassword: cubit.isPassword,
                          onSuffixPressed: () {
                            cubit.changePasswordVisibility();
                          },
                          validator: (value) {
                            if (value!.length < 6) {
                              return AppLocalizations.of(context)!.passwordMinLength;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        ConditionalBuilder(
                          condition: state is! LoginLoading,
                          builder:
                              (context) => MyButton(
                            onTap: () {
                              if (cubit.key.currentState!.validate()) {
                                cubit.login(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: AppLocalizations.of(context)!.signIn,
                          ),
                          fallback:
                              (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}