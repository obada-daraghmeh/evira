import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/routes_const.dart';
import '../../../../core/shared/features/entities/category.dart';
import '../../../../core/shared/widgets/custom_network_image.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/formatters/formatter.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(RoutesConst.categoryProducts, extra: category),
      child: Column(
        spacing: context.spacing.s8,
        children: [
          Container(
            width: context.spacing.s56,
            height: context.spacing.s56,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.5,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  context.colorScheme.primary,
                  BlendMode.srcIn,
                ),
                child: CustomNetworkImage(
                  imageUrl: category.imageUrl,
                  skeltonBorderRadius: context.spacing.s50,
                  size: context.iconSize.lg,
                ),
              ),
            ),
          ),
          Text(
            Formatter.upperFirst(category.name),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
