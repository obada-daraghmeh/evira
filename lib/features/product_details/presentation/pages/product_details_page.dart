import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/controllers/cart/cart_bloc.dart';
import '../../../../core/controllers/quantity/quantity_cubit.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/components/base_app_bar.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../../../core/shared/widgets/custom_draggable_sheet.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/helpers/show_toast.dart';
import '../controllers/color/color_cubit.dart';
import '../controllers/size/size_cubit.dart';
import '../widgets/partials/quantity_selector.dart';
import '../widgets/section_add_to_cart.dart';
import '../widgets/section_check_out.dart';
import '../widgets/section_product_description.dart';
import '../widgets/section_product_image.dart';
import '../widgets/section_product_main_info.dart';
import '../widgets/section_product_options.dart';
import '../widgets/section_product_reviews.dart';
import '../widgets/section_selection_summary.dart';

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
          appBar: BaseAppBar(
            actions: [
              IconButton(
                icon: const CustomIcon(icon: AssetsConst.share),
                onPressed: () => debugPrint('Share product'),
                tooltip: context.l10n.share,
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Container(color: context.colorScheme.surfaceContainerHighest),
              SectionProductImage(
                imageUrls: product.images
                    .where((i) => i.variantId == null)
                    .map((i) => i.imageUrl)
                    .toList(),
              ),
              CustomDraggableSheet(
                initialChildSize: 0.42,
                minChildSize: 0.42,
                children: [
                  SectionProductMainInfo(product: product),
                  const Divider(),
                  SectionProductDescription(
                    description: product.getLocalizedDescription('en'),
                  ),
                  SizedBox(height: context.spacing.s12),
                  const QuantitySelector(),
                  SizedBox(height: context.spacing.s12),
                  if (product.hasVariants)
                    SectionProductOptions(product: product),
                  const Divider(),
                  SectionSelectionSummary(product: product),
                  SizedBox(height: context.spacing.s12),
                  const SectionCheckOut(),
                  const Divider(),
                  const SectionProductReviews(),
                ],
              ),
            ],
          ),
          bottomNavigationBar: SectionAddToCart(product: product),
        ),
      ),
    );
  }
}
