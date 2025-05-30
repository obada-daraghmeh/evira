import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import 'auth_social_button.dart';

class FooterSocialButtons extends StatelessWidget {
  const FooterSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.spacing.s24,
      children: [
        _buildSocialButton(AssetsConst.facebook, () {}),
        _buildSocialButton(AssetsConst.google, () {}),
        _buildSocialButton(AssetsConst.apple, () {}),
      ],
    );
  }

  Expanded _buildSocialButton(String icon, void Function()? onPressed) {
    return Expanded(
      child: AuthSocialButton(icon: icon, onPressed: onPressed),
    );
  }
}
