import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/components/loading_button.dart';
import '../../../../core/shared/components/total_price.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class ProductSectionAddToCart extends StatelessWidget {
  final Product product;
  const ProductSectionAddToCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.p24,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TotalPrice(price: product.price, discount: product.discount),
          ),
          Expanded(
            flex: 2,
            child: LoadingButton(
              text: context.l10n.addToCart,
              icon: AssetsConst.cartBold,
              iconColor: context.colorScheme.onPrimary,
              isLoading: false,
              loaderColor: context.colorScheme.primary,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
