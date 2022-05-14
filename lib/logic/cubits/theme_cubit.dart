import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/local_storage/cache_preference.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  //late Brightness appBrightness ;
   bool _isDark = CacheProvider.getTheme()??false;
   bool get isDark =>_isDark;

  ThemeCubit() : super(ThemeInitial());

  void changeTheme(bool changeIsDark){
    _isDark = changeIsDark ;
    CacheProvider.setTheme(_isDark);
    emit(NewsThemeState());
  }
}
