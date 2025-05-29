import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeModeCubit extends HydratedCubit<ThemeMode> {
  ThemeModeCubit() : super(ThemeMode.system);

  void get toggleThemeMode =>
      emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeMode = json["themeMode"] as String?;
    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    String themeMode;
    switch (state) {
      case ThemeMode.system:
        themeMode = "system";
        break;
      case ThemeMode.light:
        themeMode = "light";
        break;
      case ThemeMode.dark:
        themeMode = "dark";
        break;
    }
    return {"themeMode": themeMode};
  }
}
