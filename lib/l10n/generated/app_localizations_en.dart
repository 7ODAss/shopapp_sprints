// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ShopCraft';

  @override
  String get appDescription => 'Your Premium Shopping Experience';

  @override
  String get welcomeBack => 'Welcome back!';

  @override
  String get signinToShopCraft => 'signin to ShopCraft';

  @override
  String get createAccount => 'Create Account';

  @override
  String get joinShopCraft => 'Join ShopCraft Today';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get emailHint => 'example@domain.com';

  @override
  String get fullNameHint => 'Enter Your Full Name';

  @override
  String get passwordHint => 'Password';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get welcomeTitle => 'Welcome!';

  @override
  String get loginFailed => 'Login Failed';

  @override
  String get emailIncludeAt => 'Please include an @ in email';

  @override
  String get supportedEmail => 'Please use a supported email (Gmail, Yahoo, etc.)';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get signInSuccess => 'Account sign-in successfully';

  @override
  String get accountCreated => 'Account created successfully';

  @override
  String get ourProducts => 'Our Products';

  @override
  String get featuredProducts => 'Featured Products';

  @override
  String get shopOurCollection => 'Shop Our Collection';

  @override
  String get hotOffers => 'Hot Offers';

  @override
  String get itemAddedToCart => 'Item added to the cart';
}
