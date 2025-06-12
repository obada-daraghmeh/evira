import 'package:flutter/material.dart';

import '../../../../../utils/extensions/constants_extension.dart';
import '../../../../../utils/extensions/intl_extension.dart';
import '../../../../../utils/extensions/theme_extension.dart';
import '../../../custom_icon.dart';

class SuggestionHeaderTitle extends StatelessWidget {
  final String title;
  final String icon;
  final bool isHistory;
  final VoidCallback? onPressed;

  const SuggestionHeaderTitle({
    super.key,
    required this.title,
    required this.icon,
    this.isHistory = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.pH24,
      child: !isHistory
          ? _buildTitle(context)
          : _buildTitle(
              context,
              children: [
                const Spacer(),
                TextButton(
                  onPressed: onPressed,
                  child: Text(context.l10n.clearAll),
                ),
              ],
            ),
    );
  }

  Row _buildTitle(BuildContext context, {List<Widget>? children}) {
    return Row(
      children: [
        CustomIcon(icon: icon),
        SizedBox(width: context.spacing.s8),
        Text(title, style: context.textTheme.titleMedium),
        ...children ?? [],
      ],
    );
  }
}
