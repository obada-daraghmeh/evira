import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/extensions/theme_extension.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final bool isColoredIcon;
  final Color? customColor;
  final double? size;

  const CustomIcon({
    super.key,
    required this.icon,
    this.isColoredIcon = false,
    this.customColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    ColorFilter? getColorFilter() {
      if (isColoredIcon) return null;
      if (customColor != null) {
        return ColorFilter.mode(customColor!, BlendMode.srcIn);
      }
      return ColorFilter.mode(context.colorScheme.onSurface, BlendMode.srcIn);
    }

    return SvgPicture.asset(
      icon,
      width: size,
      height: size,
      fit: size != null ? BoxFit.contain : BoxFit.scaleDown,
      colorFilter: getColorFilter(),
    );
  }
}
