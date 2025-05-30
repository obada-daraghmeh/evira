import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
  const double borderRadiusValue = 16.0;

  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusValue),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  return InputDecorationTheme(
    filled: true,
    fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
    contentPadding: const EdgeInsets.all(16.0),
    labelStyle: TextStyle(
      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
    ),
    floatingLabelStyle: TextStyle(color: colorScheme.primary),
    hintStyle: TextStyle(
      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
    ),
    border: outlineInputBorder(
      colorScheme.onSurfaceVariant.withValues(alpha: 0.1),
    ),
    enabledBorder: outlineInputBorder(
      colorScheme.onSurfaceVariant.withValues(alpha: 0.1),
    ),
    focusedBorder: outlineInputBorder(colorScheme.primary),
    errorBorder: outlineInputBorder(colorScheme.error),
    focusedErrorBorder: outlineInputBorder(colorScheme.error),
  );
}
