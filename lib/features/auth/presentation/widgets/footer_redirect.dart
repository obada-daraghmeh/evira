import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/theme_extension.dart';

class FooterRedirect extends StatelessWidget {
  final String promptText;
  final String actionText;
  final void Function()? onPressed;

  const FooterRedirect({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(promptText, style: context.textTheme.bodyLarge),
        TextButton(onPressed: onPressed, child: Text(actionText)),
      ],
    );
  }
}
