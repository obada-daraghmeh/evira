import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/assets_const.dart';
import '../../utils/extensions/theme_extension.dart';
import 'custom_icon.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController controller;
  final bool obscureText;
  final bool showToggleObscure;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final bool autofocus;
  final bool enabled;
  final bool autocorrect;
  final int maxLines;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;

  const CustomTextField({
    super.key,
    this.label,
    required this.controller,
    this.hint,
    this.obscureText = false,
    this.showToggleObscure = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
    this.enabled = true,
    this.autocorrect = true,
    this.maxLines = 1,
    this.focusNode,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    bool isObscure = obscureText;

    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          controller: controller,
          obscureText: isObscure,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          autofocus: autofocus,
          enabled: enabled,
          autocorrect: autocorrect,
          maxLines: obscureText ? 1 : maxLines,
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            prefixIcon: prefixIcon == null
                ? null
                : CustomIcon(
                    icon: prefixIcon!,
                    customColor: context.colorScheme.onSurfaceVariant
                        .withValues(alpha: 0.5),
                  ),
            suffixIcon: showToggleObscure
                ? IconButton(
                    icon: isObscure
                        ? CustomIcon(
                            icon: AssetsConst.eyeBold,
                            customColor: context.colorScheme.onSurfaceVariant
                                .withValues(alpha: 0.5),
                          )
                        : CustomIcon(icon: AssetsConst.eyeSlashBold),
                    onPressed: () => setState(() => isObscure = !isObscure),
                  )
                : suffixIcon,
          ),
        );
      },
    );
  }
}
