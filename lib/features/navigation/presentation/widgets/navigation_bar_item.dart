import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

BottomNavigationBarItem navigationBarItem(
  BuildContext context, {
  required String label,
  required String icon,
  required String activeIcon,
}) => BottomNavigationBarItem(
  label: label,
  icon: CustomIcon(
    icon: icon,
    customColor: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
  ),
  activeIcon: CustomIcon(icon: activeIcon),
);
