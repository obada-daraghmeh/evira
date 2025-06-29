import 'package:flutter/material.dart';

import '../../../../core/shared/features/entities/product.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import 'partials/color_selector.dart';
import 'partials/size_selector.dart';

class SectionProductOptions extends StatelessWidget {
  final Product product;
  const SectionProductOptions({super.key, required this.product});

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
                  SizeSelector(sizes: values),
                  SizedBox(height: context.spacing.s12),
                ];
              case ProductAttributeType.color:
                return [
                  ColorSelector(
                    colors: values,
                    imageUrls: product.images
                        .where((i) => i.variantId != null)
                        .map((i) => i.imageUrl)
                        .toList(),
                  ),
                  SizedBox(height: context.spacing.s12),
                ];
            }
          })
          .toList(),
    );
  }
}
