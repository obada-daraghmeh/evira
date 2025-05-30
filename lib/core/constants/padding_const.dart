import 'package:flutter/widgets.dart';

import 'sizes_const.dart';

class PaddingConst {
  const PaddingConst();

  final _sizes = const SizesConst();

  EdgeInsets get p16 => EdgeInsets.all(_sizes.s16);
  EdgeInsets get p24 => EdgeInsets.all(_sizes.s24);
}
