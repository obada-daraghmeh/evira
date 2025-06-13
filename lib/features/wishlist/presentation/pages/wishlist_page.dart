import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/controllers/wishlist/wishlist_cubit.dart';
import '../../../../core/shared/components/base_app_bar.dart';
import '../../../../core/shared/components/empty_message.dart';
import '../../../../core/shared/components/grid_view_generate.dart';
import '../../../../core/shared/components/product_card.dart';
import '../../../../core/shared/components/product_card_skeleton.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/media_query_extension.dart';
import '../../../../core/utils/helpers/show_toast.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    const int maxDisplayCount = 6;

    return Scaffold(
      appBar: BaseAppBar(title: 'Wishlist'),
      body: Padding(
        padding: context.padding.pH24,
        child: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return SingleChildScrollView(
                padding: context.padding.pH24,
                child: GridViewGenerate(
                  length: maxDisplayCount,
                  width: context.productCardSize,
                  child: (_, _) => const ProductCardSkeleton(),
                ),
              );
            }

            if (state is WishlistFailure) {
              ShowToast.showErrorToast(message: state.message);
            }

            if (state is WishlistLoaded && state.products.isNotEmpty) {
              final items = state.products.take(maxDisplayCount).toList();
              return SingleChildScrollView(
                child: GridViewGenerate(
                  length: items.length,
                  width: context.productCardSize,
                  child: (_, index) => ProductCard(product: items[index]),
                ),
              );
            }

            return Center(
              child: EmptyMessage(
                icon: AssetsConst.emptyCart,
                iconSize: context.iconSize.xxl * 3,
                message: context.l10n.emptyWishlist,
              ),
            );
          },
        ),
      ),
    );
  }
}
