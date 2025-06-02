import 'package:flutter/material.dart';

import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/theme_extension.dart';

class DotsIndicator extends StatelessWidget {
  final int length;
  final int currentPage;

  const DotsIndicator({
    super.key,
    required this.length,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.spacing.s4,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) => _dotIndicator(context, index)),
    );
  }

  AnimatedContainer _dotIndicator(BuildContext context, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: context.spacing.s8,
      width: currentPage == index ? context.spacing.s24 : context.spacing.s8,
      decoration: BoxDecoration(
        borderRadius: context.borderRadius.borderRadius4,
        color: currentPage == index
            ? context.colorScheme.primary
            : context.colorScheme.onSurfaceVariant.withValues(alpha: 0.12),
      ),
    );
  }
}
