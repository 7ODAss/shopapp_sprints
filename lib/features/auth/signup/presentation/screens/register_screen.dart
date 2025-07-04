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

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ShowDialog()
                .showMyDialog(
              context: context,
              msg: AppLocalizations.of(context)!.accountCreated,
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
          if (state is RegisterError) {
            ShowDialog().showMyDialog(
              context: context,
              msg: state.error,
              title: AppLocalizations.of(context)!.loginFailed,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
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
                          AppLocalizations.of(context)!.createAccount,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontFamily: "Suwannaphum",
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.joinShopCraft,
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
                            AppLocalizations.of(context)!.fullNameLabel,
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontFamily: "Suwannaphum",
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        MyFormField(
                          controller: cubit.nameController,
                          text: AppLocalizations.of(context)!.fullNameLabel,
                          hintText: AppLocalizations.of(context)!.fullNameHint,
                          isUpperCase: false,
                          type: TextInputType.text,
                          prefix: Icons.person,
                          coloroftextfield: Colors.deepPurple,
                        ),
                        SizedBox(height: 30),
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
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppLocalizations.of(context)!.confirmPasswordLabel,
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontFamily: "Suwannaphum",
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        MyFormField(
                          controller: cubit.confirmPasswordController,
                          text: AppLocalizations.of(context)!.confirmPasswordLabel,
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
                            if (value != cubit.passwordController.text) {
                              return AppLocalizations.of(context)!.passwordsDoNotMatch;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        ConditionalBuilder(
                          condition: state is! RegisterLoading,
                          builder:
                              (context) => MyButton(
                            onTap: () {
                              if (cubit.key.currentState!.validate()) {
                                cubit.signUp(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: AppLocalizations.of(context)!.signUp,
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