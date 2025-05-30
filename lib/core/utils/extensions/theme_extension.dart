import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isLight => colorScheme.brightness == Brightness.light;
}
