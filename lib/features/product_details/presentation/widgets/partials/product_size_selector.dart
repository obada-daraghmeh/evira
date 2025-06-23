import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/intl_extension.dart';
import 'product_section_text.dart';

class ProductSizeSelector extends StatelessWidget {
  // final List<size_entity.Size> sizes;
  // const ProductSizeSelector({super.key, required this.sizes});
  const ProductSizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductSectionText(text: context.l10n.sizes),
        // HorizontalListGenerate(
        //   length: sizes.length,
        //   generator: (index) => BlocBuilder<SizeCubit, SizeState>(
        //     builder: (context, state) {
        //       final bool selected = state.index == index;
        //       final String name = sizes[index].size;

        //       return ChoiceChip(
        //         selected: selected,
        //         label: _buildCheckMark(context, name: name, selected: selected),
        //         color: WidgetStateProperty.resolveWith((states) {
        //           if (states.contains(WidgetState.selected)) {
        //             return context.colorScheme.primary;
        //           }
        //           return context.colorScheme.surfaceContainerHighest;
        //         }),
        //         onSelected: (selected) {
        //           context.read<SizeCubit>().selectSize(index);
        //         },
        //         showCheckmark: false,
        //         tooltip: name,
        //         shape: const CircleBorder(),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }

  // Text _buildCheckMark(
  //   BuildContext context, {
  //   required String name,
  //   required bool selected,
  // }) {
  //   return Text(
  //     name,
  //     style: TextStyle(
  //       color: selected
  //           ? context.colorScheme.onPrimary
  //           : context.colorScheme.primary,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   );
  // }
}
