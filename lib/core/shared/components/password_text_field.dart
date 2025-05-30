import 'package:flutter/material.dart';

import '../../constants/assets_const.dart';
import '../../utils/extensions/intl_extension.dart';
import '../../utils/validations/validations.dart';
import '../widgets/custom_text_field.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? confirmAgainst;
  final bool isConfirm;
  final String? label;
  final String? hint;

  const PasswordTextField({
    super.key,
    required this.controller,
    this.confirmAgainst,
    this.isConfirm = false,
    this.label,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      label: label ?? context.l10n.password,
      hint: hint ?? context.l10n.enterYourField(context.l10n.password),
      obscureText: true,
      showToggleObscure: true,
      prefixIcon: AssetsConst.lockBold,
      textInputAction: isConfirm ? TextInputAction.done : TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => isConfirm
          ? Validations.confirmPassword(value, confirmAgainst?.text)
          : Validations.password(value),
    );
  }
}
