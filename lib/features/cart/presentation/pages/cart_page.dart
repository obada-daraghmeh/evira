import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/controllers/cart/cart_bloc.dart';
import '../../../../core/controllers/quantity/quantity_cubit.dart';
import '../../../../core/shared/components/empty_message.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/helpers/show_toast.dart';
import '../widgets/cart_card.dart';
import '../widgets/cart_card_skeleton.dart';
import '../widgets/cart_check_out.dart';
import '../widgets/cart_group_by_category.dart';
import '../widgets/cart_remove_item_bottom_sheet.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          ShowToast.showErrorToast(message: state.message);
        }
      },
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: 4,
                    itemBuilder: (_, _) => Padding(
                      padding: context.padding.pH24,
                      child: const CartCardSkeleton(),
                    ),
                    separatorBuilder: (_, _) =>
                        SizedBox(height: context.spacing.s16),
                  ),
                ),
              ],
            );
          }

          if (state is CartLoaded && state.cartItems.isNotEmpty) {
            final cartItemsByCategory = state.cartItems;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cartItemsByCategory.length,
                    itemBuilder: (context, index) {
                      final categoryName = cartItemsByCategory.keys.elementAt(
                        index,
                      );
                      final items = cartItemsByCategory[categoryName]!;

                      return Padding(
                        padding: context.padding.pH24,
                        child: CartGroupByCategory(
                          itemsCount: items.length,
                          categoryName: items.first.getLocalizedCategoryName(
                            'en',
                          ),
                          child: Column(
                            spacing: context.spacing.s16,
                            children: [
                              for (final item in items) ...[
                                BlocProvider(
                                  create: (_) => QuantityCubit(
                                    initialQuantity: item.quantity,
                                  ),
                                  child: GestureDetector(
                                    onLongPress: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            CartRemoveItemBottomSheet(
                                              cart: item,
                                            ),
                                      );
                                    },
                                    child: CartCard(cartItem: item),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, _) =>
                        SizedBox(height: context.spacing.s16),
                  ),
                ),
                CartCheckOut(
                  items: cartItemsByCategory.values
                      .expand((items) => items)
                      .toList(),
                ),
              ],
            );
          }

          return EmptyMessage(
            icon: AssetsConst.emptyCart,
            iconSize: context.iconSize.xxl * 3,
            message: context.l10n.emptyCartMsg,
          );
        },
      ),
    );
  }
}
