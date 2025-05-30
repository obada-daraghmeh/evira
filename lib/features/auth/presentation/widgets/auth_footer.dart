import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/constants_extension.dart';
import 'footer_redirect.dart';
import 'footer_social_buttons.dart';
import 'footer_text_divider.dart';

class AuthFooter extends StatelessWidget {
  final String promptText;
  final String actionText;
  final void Function()? onRedirectPressed;

  const AuthFooter({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onRedirectPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.s24,
      children: [
        const FooterTextDivider(),
        const FooterSocialButtons(),
        FooterRedirect(
          promptText: promptText,
          actionText: actionText,
          onPressed: onRedirectPressed,
        ),
      ],
    );
  }
}
