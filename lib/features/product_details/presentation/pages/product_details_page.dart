import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/controllers/cart/cart_bloc.dart';
import '../../../../core/controllers/quantity/quantity_cubit.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/components/base_app_bar.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../../../core/shared/widgets/custom_draggable_sheet.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/helpers/show_toast.dart';
import '../controllers/color/color_cubit.dart';
import '../controllers/size/size_cubit.dart';
import '../widgets/product_add_to_cart.dart';
import '../widgets/product_check_out.dart';
import '../widgets/product_description.dart';
import '../widgets/product_image.dart';
import '../widgets/product_main_info.dart';
import '../widgets/product_options.dart';
import '../widgets/product_quantity_selector.dart';
import '../widgets/product_reviews.dart';
import '../widgets/selection_summary_text.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SizeCubit>()),
        BlocProvider(create: (_) => getIt<ColorCubit>()),
        BlocProvider(create: (_) => getIt<QuantityCubit>()),
        BlocProvider(create: (_) => getIt<CartBloc>()),
      ],
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartFailure) {
            ShowToast.showErrorToast(message: state.message);
          }
          if (state is CartLoaded) {
            ShowToast.showSuccessToast(message: context.l10n.cartSuccessMsg);
          }
        },
        child: Scaffold(
          appBar: const BaseAppBar(),
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Container(color: context.colorScheme.surfaceContainerHighest),
              ProductImage(product: product),
              CustomDraggableSheet(
                initialChildSize: 0.42,
                minChildSize: 0.42,
                children: [
                  ProductMainInfo(product: product),
                  const Divider(),
                  ProductDescription(
                    description: product.getLocalizedDescription('en'),
                  ),
                  SizedBox(height: context.spacing.s12),
                  if (product.hasVariants) ...[
                    ProductOptions(product: product),
                    SizedBox(height: context.spacing.s12),
                  ],
                  const ProductQuantitySelector(),
                  SizedBox(height: context.spacing.s12),
                  SelectionSummaryText(product: product),
                  SizedBox(height: context.spacing.s12),
                  const ProductCheckOut(),
                  const Divider(),
                  const ProductReviews(),
                ],
              ),
            ],
          ),
          bottomNavigationBar: ProductAddToCart(product: product),
        ),
      ),
    );
  }
}
