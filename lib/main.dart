import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app_sprints/core/shared/network/local/supabase_helper.dart';
import 'package:shop_app_sprints/features/auth/intro/presentation/screens/intro_screen.dart';
import 'package:shop_app_sprints/features/home/presentation/screens/home_screen.dart';
import 'core/shared/controller/cubit.dart';
import 'l10n/generated/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupaBaseHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalCubit(),
      child: BlocBuilder<LocalCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            locale: locale, // Set the current locale
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            builder: (context, child) {
              return Directionality(
                textDirection: locale.languageCode == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: child!,
              );
            },
            debugShowCheckedModeBanner: false,
            home: const IntroScreen(),
          );
        },
      ),
    );
  }
}