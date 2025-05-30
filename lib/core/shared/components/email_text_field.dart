import 'package:flutter/material.dart';

import '../../constants/assets_const.dart';
import '../../utils/extensions/intl_extension.dart';
import '../../utils/validations/validations.dart';
import '../widgets/custom_text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      label: context.l10n.email,
      hint: context.l10n.enterYourField(context.l10n.email),
      prefixIcon: AssetsConst.message,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) => Validations.email(value),
    );
  }
}
