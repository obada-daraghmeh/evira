import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/formatters/formatter.dart';

class CartGroupByCategory extends StatelessWidget {
  final String categoryName;
  final Widget child;

  const CartGroupByCategory({
    super.key,
    required this.categoryName,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          spacing: context.spacing.s8,
          children: [
            CustomIcon(icon: AssetsConst.inbox, size: context.iconSize.sm),
            Text(
              Formatter.upperFirst(categoryName),
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Divider(),
        child,
      ],
    );
  }
}
