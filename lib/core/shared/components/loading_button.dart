import 'package:flutter/material.dart';

import '../widgets/custom_icon.dart';
import '../widgets/custom_loader.dart';

class LoadingButton extends StatelessWidget {
  final String text;
  final String? icon;
  final double? height;
  final bool isLoading;
  final bool iconAtStart;
  final Color? iconColor;
  final Color? loaderColor;
  final Color? backgroundColor;
  final void Function()? onPressed;

  const LoadingButton({
    super.key,
    required this.text,
    this.icon,
    this.height,
    this.isLoading = false,
    this.iconAtStart = true,
    this.iconColor,
    this.loaderColor,
    this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final style = FilledButton.styleFrom(
      fixedSize: height != null ? Size.fromHeight(height!) : null,
      backgroundColor: backgroundColor,
    );

    final child = isLoading ? CustomLoader(color: loaderColor) : Text(text);

    if (icon != null && !isLoading) {
      return FilledButton.icon(
        onPressed: onPressed,
        style: style,
        icon: CustomIcon(icon: icon!, customColor: iconColor),
        label: Text(text),
        iconAlignment: iconAtStart ? IconAlignment.start : IconAlignment.end,
      );
    }

    return FilledButton(onPressed: onPressed, style: style, child: child);
  }
}
