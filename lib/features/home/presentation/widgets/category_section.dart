import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/controllers/category/category_bloc.dart';
import '../../../../core/shared/components/error_message.dart';
import '../../../../core/shared/components/grid_view_generate.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/media_query_extension.dart';
import '../../../../core/utils/helpers/show_toast.dart';
import 'category_item.dart';
import 'category_item_skeleton.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    const int maxDisplayCount = 8;
    double categoryItemSize =
        (context.sWidth - context.spacing.s24 * 2 - context.spacing.s12 * 3) /
        4;

    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return GridViewGenerate(
            length: maxDisplayCount,
            width: categoryItemSize,
            child: (_, _) => const CategoryItemSkeleton(),
          );
        }

        if (state is CategoryFailure) {
          ShowToast.showErrorToast(message: state.message);
        }

        if (state is CategoryLoaded && state.categories.isNotEmpty) {
          return GridViewGenerate(
            length: min(state.categories.length, maxDisplayCount),
            width: categoryItemSize,
            child: (_, index) =>
                CategoryItem(category: state.categories[index]),
          );
        }

        return const ErrorMessage();
      },
    );
  }
}
