import 'package:flutter/material.dart';

import 'constants_extension.dart';

extension MediaQueryExtension on BuildContext {
  double get sHeight => MediaQuery.of(this).size.height;
  double get sWidth => MediaQuery.of(this).size.width;

  /// Custom Size
  double get productCardSize => (sWidth - spacing.s24 * 2 - spacing.s12) / 2;
}
