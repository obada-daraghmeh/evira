import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../product/domain/entities/color.dart' as color_entity;
import '../../../product/domain/entities/size.dart' as size_entity;
import 'partials/product_color_selector.dart';
import 'partials/product_size_selector.dart';

class ProductSectionVariants extends StatelessWidget {
  final List<size_entity.Size> sizes;
  final List<color_entity.Color> colors;

  const ProductSectionVariants({
    super.key,
    required this.sizes,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.spacing.s16,
      children: [
        Expanded(child: ProductSizeSelector(sizes: sizes)),
        Expanded(child: ProductColorSelector(colors: colors)),
      ],
    );
  }
}
