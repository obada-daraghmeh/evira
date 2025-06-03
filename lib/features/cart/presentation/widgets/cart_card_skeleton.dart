import 'package:flutter/widgets.dart';

import '../../../../core/shared/widgets/custom_skeleton.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import 'partials/cart_card_layout_builder.dart';

class CartCardSkeleton extends StatelessWidget {
  const CartCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return CartCardLayoutBuilder(
      showSkeleton: true,
      child: Row(
        spacing: context.spacing.s16,
        children: [
          _buildCartCardImageSkeleton,
          _buildCartCardDetailsSkeleton(context),
        ],
      ),
    );
  }

  Widget get _buildCartCardImageSkeleton {
    return const Expanded(
      flex: 2,
      child: CustomSkeleton(width: double.infinity, height: double.infinity),
    );
  }

  Widget _buildCartCardDetailsSkeleton(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCartCardTitleRow(context),
          _buildCartCardColorSizeRow(context),
          const Spacer(),
          _buildCartCardPriceQuantityRow(context),
        ],
      ),
    );
  }

  Widget _buildCartCardTitleRow(BuildContext context) {
    return Row(
      spacing: context.spacing.s8,
      children: [
        Expanded(child: CustomSkeleton(height: context.spacing.s16)),
        CustomSkeleton(
          width: context.spacing.s30,
          height: context.spacing.s30,
          borderRadius: context.spacing.s50,
        ),
      ],
    );
  }

  Widget _buildCartCardColorSizeRow(BuildContext context) {
    return Row(
      spacing: context.spacing.s8,
      children: [
        CustomSkeleton(
          width: context.spacing.s24,
          height: context.spacing.s24,
          borderRadius: context.spacing.s50,
        ),
        CustomSkeleton(width: context.spacing.s48, height: context.spacing.s16),
        CustomSkeleton(width: context.spacing.s4, height: context.spacing.s16),
        CustomSkeleton(width: context.spacing.s48, height: context.spacing.s16),
      ],
    );
  }

  Widget _buildCartCardPriceQuantityRow(BuildContext context) {
    return Row(
      spacing: context.spacing.s12,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSkeleton(width: context.spacing.s48, height: context.spacing.s16),
        Expanded(
          child: CustomSkeleton(
            height: context.spacing.s48,
            borderRadius: context.spacing.s50,
          ),
        ),
      ],
    );
  }
}
