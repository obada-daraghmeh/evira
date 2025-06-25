import 'package:flutter/material.dart';

import '../../../../core/shared/components/quantity_selector.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import 'product_section_text.dart';

class ProductQuantitySelector extends StatelessWidget {
  const ProductQuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.spacing.s16,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProductSectionHeader(text: context.l10n.quantity),
        const QuantitySelector(),
      ],
    );
  }
}
