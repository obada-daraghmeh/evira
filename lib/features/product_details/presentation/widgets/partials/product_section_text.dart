import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/theme_extension.dart';

class ProductSectionText extends StatelessWidget {
  final String text;
  const ProductSectionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
