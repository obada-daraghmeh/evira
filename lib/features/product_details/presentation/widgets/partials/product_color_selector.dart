import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/intl_extension.dart';
import 'product_section_text.dart';

class ProductColorSelector extends StatelessWidget {
  // final List<color_entity.Color> colors;
  // const ProductColorSelector({super.key, required this.colors});
  const ProductColorSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductSectionText(text: context.l10n.colors),
        // HorizontalListGenerate(
        //   length: colors.length,
        //   generator: (index) => BlocBuilder<ColorCubit, ColorState>(
        //     builder: (context, state) {
        //       final bool selected = state.index == index;
        //       final Color color = ProductHelpers.colorFromHexCode(
        //         colors[index].hexCode,
        //       );

        //       return ChoiceChip(
        //         selected: selected,
        //         label: _buildCheckMark(context, selected: selected),
        //         onSelected: (selected) {
        //           context.read<ColorCubit>().selectColor(index);
        //         },
        //         color: WidgetStateProperty.resolveWith((states) {
        //           if (states.contains(WidgetState.selected)) {
        //             return color;
        //           }
        //           return color;
        //         }),
        //         showCheckmark: false,
        //         tooltip: colors[index].name,
        //         shape: const CircleBorder(),
        //         side: BorderSide.none,
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }

  // SizedBox _buildCheckMark(BuildContext context, {required bool selected}) {
  //   return SizedBox(
  //     width: context.spacing.s20,
  //     height: context.spacing.s20,
  //     child: selected
  //         ? CustomIcon(
  //             icon: AssetsConst.checkBold,
  //             customColor: context.colorScheme.surface,
  //             size: context.iconSize.md,
  //           )
  //         : null,
  //   );
  // }
}
