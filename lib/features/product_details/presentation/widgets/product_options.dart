import 'package:flutter/material.dart';

import '../../../../core/shared/features/entities/product.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import 'product_color_selector.dart';
import 'product_size_selector.dart';

class ProductOptions extends StatelessWidget {
  final Product product;
  const ProductOptions({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ProductAttributeType.values
          .where((type) => product.hasVariantAttribute(type))
          .expand((type) {
            final values = product.getVariantValues(type);

            switch (type) {
              case ProductAttributeType.size:
                return [
                  ProductSizeSelector(sizes: values),
                  SizedBox(height: context.spacing.s12),
                ];
              case ProductAttributeType.color:
                return [
                  ProductColorSelector(colors: values),
                  SizedBox(height: context.spacing.s12),
                ];
            }
          })
          .toList(),
    );
  }
}
