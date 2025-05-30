import 'package:flutter/material.dart';

CheckboxThemeData checkboxTheme(ColorScheme colorScheme) {
  return CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onSurface.withValues(alpha: 0.12);
      }
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary;
      }
      return colorScheme.surface;
    }),
    checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
    side: WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return BorderSide.none;
      }
      if (states.contains(WidgetState.selected)) {
        return BorderSide(color: colorScheme.primary, width: 2);
      }
      return BorderSide(color: colorScheme.onSurfaceVariant, width: 2);
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
