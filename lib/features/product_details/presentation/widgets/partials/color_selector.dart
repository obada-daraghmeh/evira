import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions/constants_extension.dart';
import '../../../../../core/utils/extensions/intl_extension.dart';
import '../../../../../core/utils/formatters/formatter.dart';
import '../../controllers/color/color_cubit.dart';
import 'image_type_selector.dart';
import 'section_header.dart';

class ColorSelector extends StatelessWidget {
  final List colors;
  final List<String>? imageUrls;

  const ColorSelector({
    super.key,
    required this.colors,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SectionHeader(text: context.l10n.color),
        imageUrls?.isNotEmpty ?? false
            ? BlocBuilder<ColorCubit, ColorState>(
                builder: (context, state) {
                  return ImageTypeSelector(
                    selectedIndex: state.index,
                    imageUrls: imageUrls!,
                    onTap: (index) =>
                        context.read<ColorCubit>().selectColor(index),
                  );
                },
              )
            :
              //! Temp solution for no image URLs
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
