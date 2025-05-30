import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class FooterTextDivider extends StatelessWidget {
  const FooterTextDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(indent: 0, endIndent: context.spacing.s16)),
        Text(context.l10n.orContinueWith, style: context.textTheme.bodyLarge),
        Expanded(child: Divider(indent: context.spacing.s16, endIndent: 0)),
      ],
    );
  }
}
