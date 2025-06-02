import 'package:flutter/material.dart';

import '../../../utils/extensions/intl_extension.dart';
import '../../../utils/extensions/theme_extension.dart';

class SalesNumberChip extends StatelessWidget {
  final int count;
  const SalesNumberChip({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        context.l10n.countSold(count.toString()),
        style: context.textTheme.labelMedium,
      ),
      side: BorderSide.none,
      backgroundColor: context.colorScheme.surfaceContainerHighest.withValues(
        alpha: 0.5,
      ),
      padding: EdgeInsets.zero,
    );
  }
}
