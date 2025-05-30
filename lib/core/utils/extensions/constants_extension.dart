import 'package:flutter/widgets.dart';

import '../../constants/border_radius_const.dart';
import '../../constants/icon_sizes_const.dart';
import '../../constants/padding_const.dart';
import '../../constants/sizes_const.dart';

extension ConstantsExtension on BuildContext {
  SizesConst get spacing => const SizesConst();
  IconSizesConst get iconSize => const IconSizesConst();
  PaddingConst get padding => const PaddingConst();
  BorderRadiusConst get borderRadius => const BorderRadiusConst();
}
