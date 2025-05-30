import "package:flutter/material.dart";

import "../shared/themes/buttons_theme.dart";
import "../shared/themes/checkbox_theme.dart";
import "../shared/themes/input_decoration_theme.dart";

class MaterialTheme {
  final TextTheme textTheme;
  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF101010),
      surfaceTint: Color(0xFF101010),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFE0E0E0),
      onPrimaryContainer: Color(0xFF000000),
      secondary: Color(0xFFE7E7E7),
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFFF3F3F3),
      onSecondaryContainer: Color(0xFF000000),
      tertiary: Color(0xff525e7d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdae2ff),
      onTertiaryContainer: Color(0xff3b4664),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff3f484a),
      outline: Color(0xff6f797a),
      outlineVariant: Color(0xffbfc8ca),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xFFE0E0E0),
      primaryFixed: Color(0xFFE0E0E0),
      onPrimaryFixed: Color(0xFF000000),
      primaryFixedDim: Color(0xFF2A2A2A),
      onPrimaryFixedVariant: Color(0xFF101010),
      secondaryFixed: Color(0xFFF3F3F3),
      onSecondaryFixed: Color(0xFF000000),
      secondaryFixedDim: Color(0xFFE7E7E7),
      onSecondaryFixedVariant: Color(0xFF4A4A4A),
      tertiaryFixed: Color(0xffdae2ff),
      onTertiaryFixed: Color(0xff0e1b37),
      tertiaryFixedDim: Color(0xffbac6ea),
      onTertiaryFixedVariant: Color(0xff3b4664),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFAFAFA),
      surfaceTint: Color(0xFFFAFAFA),
      onPrimary: Color(0xFF101010),
      primaryContainer: Color(0xFFDADADA),
      onPrimaryContainer: Color(0xFF000000),
      secondary: Color(0xFF35383F),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFF1E1F24),
      onSecondaryContainer: Color(0xFFE7E7E7),
      tertiary: Color(0xffbac6ea),
      onTertiary: Color(0xff24304d),
      tertiaryContainer: Color(0xff3b4664),
      onTertiaryContainer: Color(0xffdae2ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdee3e5),
      onSurfaceVariant: Color(0xffbfc8ca),
      outline: Color(0xff899294),
      outlineVariant: Color(0xff3f484a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xFF101010),
      primaryFixed: Color(0xFFDADADA),
      onPrimaryFixed: Color(0xFF000000),
      primaryFixedDim: Color(0xFFB0B0B0),
      onPrimaryFixedVariant: Color(0xFF333333),
      secondaryFixed: Color(0xFF1E1F24),
      onSecondaryFixed: Color(0xFFFFFFFF),
      secondaryFixedDim: Color(0xFF35383F),
      onSecondaryFixedVariant: Color(0xFFE7E7E7),
      tertiaryFixed: Color(0xffdae2ff),
      onTertiaryFixed: Color(0xff0e1b37),
      tertiaryFixedDim: Color(0xffbac6ea),
      onTertiaryFixedVariant: Color(0xff3b4664),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    inputDecorationTheme: inputDecorationTheme(colorScheme),
    checkboxTheme: checkboxTheme(colorScheme),
    filledButtonTheme: ButtonsTheme.filledButtonThemeData(colorScheme),
    textButtonTheme: ButtonsTheme.textButtonThemeData(colorScheme),
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
