import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/controllers/cart/cart_bloc.dart';
import '../../../../core/controllers/quantity/quantity_cubit.dart';
import '../../../../core/shared/components/loading_button.dart';
import '../../../../core/shared/components/total_price.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../../../core/utils/extensions/auth_state_extension.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../cart/domain/entities/cart.dart';

class ProductSectionAddToCart extends StatelessWidget {
  final Product product;
  const ProductSectionAddToCart({super.key, required this.product});

  void _handleAddToCart(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    final quantity = context.read<QuantityCubit>().state.quantity;
    // final sizeIndex = context.read<SizeCubit>().state.index;
    // final colorIndex = context.read<ColorCubit>().state.index;

    // final isValidSize = sizeIndex >= 0 && sizeIndex < product.sizes.length;
    // final isValidColor = colorIndex >= 0 && colorIndex < product.colors.length;

    // if (!isValidSize || !isValidColor) {
    //   ShowToast.showErrorToast(message: 'Please select size and color');
    //   return;
    // }

    // final selectedSize = product.sizes[sizeIndex].size;
    // final selectedColor = product.colors[colorIndex].hexCode;

    final cartItem = Cart(
      userId: context.currentUser.id,
      productId: product.id,
      quantity: quantity,
      size: 'selectedSize',
      color: 'selectedColor',
    );

    cartBloc.add(AddToCart(cart: cartItem));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.p24,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TotalPrice(price: product.basePrice, discount: 0),
          ),
          Expanded(
            flex: 2,
            child: BlocBuilder<CartBloc, CartState>(
              builder: (_, state) {
                final isLoading = state is CartLoading;

                return LoadingButton(
                  text: context.l10n.addToCart,
                  icon: AssetsConst.cartBold,
                  iconColor: context.colorScheme.onPrimary,
                  isLoading: isLoading,
                  loaderColor: context.colorScheme.primary,
                  onPressed: isLoading ? null : () => _handleAddToCart(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
