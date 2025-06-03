import 'package:flutter/material.dart';

import '../../../../../core/constants/assets_const.dart';
import '../../../../../core/shared/widgets/custom_icon.dart';
import '../../../../../core/utils/extensions/constants_extension.dart';
import '../../../../../core/utils/extensions/intl_extension.dart';
import '../../../../../core/utils/extensions/media_query_extension.dart';
import '../../../../../core/utils/extensions/theme_extension.dart';
import '../../../domain/entities/cart.dart';
import '../remove_cart_item_bottom_sheet.dart';

class CartCardTitleRow extends StatelessWidget {
  final Cart cart;
  final bool isReadOnly;

  const CartCardTitleRow({
    super.key,
    required this.cart,
    required this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    final smallScreen = context.sWidth < 400;
    return Row(
      spacing: smallScreen ? 0 : context.spacing.s8,
      mainAxisAlignment: smallScreen
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            cart.title ?? '',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (!isReadOnly) _buildRemoveButton(context),
      ],
    );
  }

  IconButton _buildRemoveButton(BuildContext context) {
    return IconButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isDismissible: false,
        builder: (context) => RemoveCartItemBottomSheet(cart: cart),
      ),
      icon: const CustomIcon(icon: AssetsConst.delete),
      tooltip: context.l10n.remove,
    );
  }
}
