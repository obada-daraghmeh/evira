import 'package:flutter/material.dart';

import '../../utils/extensions/intl_extension.dart';
import '../../utils/extensions/theme_extension.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showSeeAll;
  final Function()? onTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.showSeeAll = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (!showSeeAll) return _buildTitleText(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTitleText(context),
        GestureDetector(
          onTap: onTap,
          child: Text(
            context.l10n.seeAll,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Text _buildTitleText(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
