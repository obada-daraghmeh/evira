import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/formatters/formatter.dart';

class CartGroupByCategory extends StatelessWidget {
  final int itemsCount;
  final String categoryName;
  final Widget child;

  const CartGroupByCategory({
    super.key,
    required this.itemsCount,
    required this.categoryName,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: context.spacing.s8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIcon(
              icon: AssetsConst.inbox,
              size: context.iconSize.sm,
              customColor: context.colorScheme.primary,
            ),
            Expanded(
              child: Text(
                Formatter.upperFirst(categoryName),
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing.s8,
                vertical: context.spacing.s2,
              ),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(alpha: 0.08),
                borderRadius: context.borderRadius.borderRadius8,
              ),
              child: Text(
                context.l10n.cartItemCount(itemsCount),
                style: context.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.primary,
                ),
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
