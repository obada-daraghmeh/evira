import 'package:flutter/material.dart';

import '../../constants/assets_const.dart';
import '../../utils/extensions/intl_extension.dart';
import '../../utils/validations/validations.dart';
import '../widgets/custom_text_field.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  const NameTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      label: context.l10n.name,
      hint: context.l10n.enterYourField(context.l10n.name),
      prefixIcon: AssetsConst.profileBold,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: (value) => Validations.name(value),
    );
  }
}
