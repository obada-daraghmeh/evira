import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class AuthSocialButton extends StatelessWidget {
  final String icon;
  final void Function()? onPressed;

  const AuthSocialButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: _buildOutlinedButtonStyle(context),
      child: CustomIcon(icon: icon, isColoredIcon: true),
    );
  }

  ButtonStyle? _buildOutlinedButtonStyle(BuildContext context) {
    return OutlinedButton.styleFrom(
      fixedSize: Size.fromHeight(context.spacing.s60),
      shape: RoundedRectangleBorder(
        borderRadius: context.borderRadius.radius16,
        side: BorderSide(
          color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.12),
        ),
      ),
    );
  }
}
