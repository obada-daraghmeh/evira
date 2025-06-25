import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/formatters/formatter.dart';
import '../controllers/color/color_cubit.dart';
import 'product_section_text.dart';

class ProductColorSelector extends StatelessWidget {
  final List colors;
  const ProductColorSelector({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductSectionHeader(
          text: context.l10n.selectAttribute(context.l10n.color),
        ),
        Wrap(
          spacing: context.spacing.s8,
          children: colors.map((color) {
            int index = colors.indexOf(color);
            return BlocBuilder<ColorCubit, ColorState>(
              builder: (context, state) => ChoiceChip(
                label: Text(Formatter.upperFirst(color)),
                selected: state.index == index,
                onSelected: (selected) =>
                    context.read<ColorCubit>().selectColor(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
