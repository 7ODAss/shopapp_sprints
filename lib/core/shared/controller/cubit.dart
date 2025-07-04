import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LocalCubit extends Cubit<Locale>{
  LocalCubit() : super(const Locale('en'));
  static LocalCubit get(context) => BlocProvider.of<LocalCubit>(context);

  void toggleLocale() {
    final newLocale = state.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    emit(newLocale);
  }

  void setLocale(Locale locale) {
    if (state != locale) {
      emit(locale);
    }
  }

}