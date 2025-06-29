import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/assets_const.dart';
import '../../../../../core/shared/widgets/custom_icon.dart';
import '../../../../../core/utils/extensions/constants_extension.dart';
import '../../../../../core/utils/extensions/intl_extension.dart';
import '../../../../../core/utils/extensions/media_query_extension.dart';
import '../../../../../core/utils/extensions/theme_extension.dart';
import '../../controllers/size/size_cubit.dart';
import 'section_header.dart';

class SizeSelector extends StatelessWidget {
  final List sizes;
  const SizeSelector({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SectionHeader(text: context.l10n.size),
        SizedBox(
          width: context.sWidth * 0.4,
          child: DropdownButtonFormField(
            items: sizes
                .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<SizeCubit>().selectSize(sizes.indexOf(value));
              }
            },
            hint: Text(context.l10n.selectAttribute(context.l10n.size)),
            borderRadius: context.borderRadius.borderRadius8,
            icon: CustomIcon(
              icon: AssetsConst.chevronDown,
              size: context.iconSize.sm,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: context.colorScheme.surface,
              contentPadding: context.padding.pH16,
              border: OutlineInputBorder(
                borderRadius: context.borderRadius.borderRadius8,
                borderSide: BorderSide(
                  color: context.colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
