import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get sHeight => MediaQuery.of(this).size.height;
  double get sWidth => MediaQuery.of(this).size.width;
}
