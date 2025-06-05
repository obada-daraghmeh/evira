import 'package:flutter/widgets.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: context.spacing.s12,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIcon(
            icon: AssetsConst.emptySearch,
            isColoredIcon: true,
            size: context.iconSize.xxl * 2,
          ),
          Text(
            context.l10n.noResultsFoundTitle,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            context.l10n.noResultsFoundSubtitle,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
