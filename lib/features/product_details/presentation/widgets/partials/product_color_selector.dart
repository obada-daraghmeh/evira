import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/assets_const.dart';
import '../../../../../core/shared/components/horizontal_list_generate.dart';
import '../../../../../core/shared/widgets/custom_icon.dart';
import '../../../../../core/utils/extensions/constants_extension.dart';
import '../../../../../core/utils/extensions/intl_extension.dart';
import '../../../../../core/utils/extensions/theme_extension.dart';
import '../../../../../core/utils/helpers/product_helpers.dart';
import '../../../../product/domain/entities/color.dart' as color_entity;
import '../../controllers/color/color_cubit.dart';
import 'product_section_text.dart';

class ProductColorSelector extends StatelessWidget {
  final List<color_entity.Color> colors;
  const ProductColorSelector({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductSectionText(text: context.l10n.colors),
        HorizontalListGenerate(
          length: colors.length,
          generator: (index) => BlocBuilder<ColorCubit, ColorState>(
            builder: (context, state) {
              final bool selected = state.index == index;
              final Color color = ProductHelpers.colorFromHexCode(
                colors[index].hexCode,
              );

              return ChoiceChip(
                selected: selected,
                label: _buildCheckMark(context, selected: selected),
                onSelected: (selected) {
                  context.read<ColorCubit>().selectColor(index);
                },
                color: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return color;
                  }
                  return color;
                }),
                showCheckmark: false,
                tooltip: colors[index].name,
                shape: const CircleBorder(),
                side: BorderSide.none,
              );
            },
          ),
        ),
      ],
    );
  }

  SizedBox _buildCheckMark(BuildContext context, {required bool selected}) {
    return SizedBox(
      width: context.spacing.s20,
      height: context.spacing.s20,
      child: selected
          ? CustomIcon(
              icon: AssetsConst.checkBold,
              customColor: context.colorScheme.surface,
              size: context.iconSize.md,
            )
          : null,
    );
  }
}
