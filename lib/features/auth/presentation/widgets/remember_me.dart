import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        Text(context.l10n.rememberMe, style: context.textTheme.bodyLarge),
      ],
    );
  }
}
