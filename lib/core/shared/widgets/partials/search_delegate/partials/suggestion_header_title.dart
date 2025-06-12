import 'package:flutter/material.dart';

import '../../../../../utils/extensions/constants_extension.dart';
import '../../../../../utils/extensions/intl_extension.dart';
import '../../../../../utils/extensions/theme_extension.dart';

class SuggestionHeaderTitle extends StatelessWidget {
  final String title;
  final bool isHistory;
  final VoidCallback? onPressed;

  const SuggestionHeaderTitle({
    super.key,
    required this.title,
    this.isHistory = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.pH24,
      child: !isHistory
          ? _buildTitle(context)
          : Row(
              children: [
                _buildTitle(context),
                const Spacer(),
                TextButton(
                  onPressed: onPressed,
                  child: Text(context.l10n.clearAll),
                ),
              ],
            ),
    );
  }

  Text _buildTitle(BuildContext context) =>
      Text(title, style: context.textTheme.titleMedium);
}
