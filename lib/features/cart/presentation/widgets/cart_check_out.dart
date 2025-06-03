import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/components/loading_button.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/media_query_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/helpers/product_helpers.dart';
import '../../domain/entities/cart.dart';

class CartCheckOut extends StatelessWidget {
  final List<Cart> items;
  const CartCheckOut({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sWidth,
      padding: context.padding.p24,
      decoration: BoxDecoration(
        borderRadius: context.borderRadius.borderRadiusVT24,
        color: context.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        spacing: context.spacing.s24,
        children: [
          Column(
            spacing: context.spacing.s4,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.totalPrice,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                context.l10n.priceInILS(
                  ProductHelpers.calculateTotal(items).toStringAsFixed(2),
                ),
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: LoadingButton(
              isLoading: false,
              text: context.l10n.checkout,
              icon: AssetsConst.arrowRightBold,
              iconAtStart: false,
              iconColor: context.colorScheme.onPrimary,
              loaderColor: context.colorScheme.primary,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
