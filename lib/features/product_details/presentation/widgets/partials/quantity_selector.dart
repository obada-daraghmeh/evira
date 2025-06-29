import 'package:flutter/material.dart';

import '../../../../../core/shared/components/quantity_selector.dart'
    as selector;
import '../../../../../core/utils/extensions/intl_extension.dart';
import 'section_header.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SectionHeader(text: context.l10n.quantity),
        const selector.QuantitySelector(),
      ],
    );
  }
}
