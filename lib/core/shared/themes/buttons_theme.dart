import 'package:flutter/material.dart';

class ButtonsTheme {
  static FilledButtonThemeData filledButtonThemeData(ColorScheme colorScheme) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        fixedSize: const Size.fromHeight(58.0),
      ),
    );
  }

  static TextButtonThemeData textButtonThemeData(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        // fixedSize: const Size.fromHeight(58.0),
      ),
    );
  }
}
