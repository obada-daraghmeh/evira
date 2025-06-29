import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/controllers/quantity/quantity_cubit.dart';
import '../../../../core/shared/features/entities/product.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/media_query_extension.dart';
import '../../../../core/utils/formatters/formatter.dart';
import '../controllers/color/color_cubit.dart';
import '../controllers/size/size_cubit.dart';
import 'partials/section_header.dart';

class SectionSelectionSummary extends StatelessWidget {
  final Product product;
  const SectionSelectionSummary({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final quantity = context.select<QuantityCubit, int>(
      (c) => c.state.quantity,
    );
    final size = context.select<SizeCubit, String>(
      (c) => (c.state.index >= 0) ? product.getSizeName(c.state.index) : '',
    );
    final color = context.select<ColorCubit, String>(
      (c) => (c.state.index >= 0) ? product.getColorName(c.state.index) : '',
    );

    return Column(
      spacing: context.spacing.s8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(text: context.l10n.details),
        SizedBox(
          width: (context.sWidth - context.spacing.s24 * 2),
          child: DataTable(
            columnSpacing: context.spacing.s24,
            dataRowMinHeight: context.spacing.s32,
            dataRowMaxHeight: context.spacing.s40,
            headingRowHeight: context.spacing.s40,
            columns: [
              DataColumn(label: Text(context.l10n.attribute)),
              DataColumn(label: Text(context.l10n.value)),
            ],
            rows: [
              if (size.isNotEmpty)
                DataRow(
                  cells: [
                    DataCell(Text(context.l10n.size)),
                    DataCell(Text(size.toUpperCase())),
                  ],
                ),
              if (color.isNotEmpty)
                DataRow(
                  cells: [
                    DataCell(Text(context.l10n.color)),
                    DataCell(Text(Formatter.upperFirst(color))),
                  ],
                ),
              DataRow(
                cells: [
                  DataCell(Text(context.l10n.quantity)),
                  DataCell(Text('$quantity')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
