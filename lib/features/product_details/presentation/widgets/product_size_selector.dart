import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../controllers/size/size_cubit.dart';
import 'product_section_text.dart';

class ProductSizeSelector extends StatelessWidget {
  final List sizes;
  const ProductSizeSelector({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductSectionHeader(
          text: context.l10n.selectAttribute(context.l10n.size),
        ),
        Wrap(
          spacing: context.spacing.s8,
          children: sizes.map((size) {
            int index = sizes.indexOf(size);
            return BlocBuilder<SizeCubit, SizeState>(
              builder: (context, state) => ChoiceChip(
                label: Text(size.toUpperCase()),
                selected: state.index == index,
                onSelected: (selected) =>
                    context.read<SizeCubit>().selectSize(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
