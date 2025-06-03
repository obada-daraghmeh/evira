import 'package:flutter/widgets.dart';

import 'sizes_const.dart';

class PaddingConst {
  const PaddingConst();

  final _sizes = const SizesConst();

  /// `Padding All`
  EdgeInsets get p16 => EdgeInsets.all(_sizes.s16);
  EdgeInsets get p24 => EdgeInsets.all(_sizes.s24);

  /// `Padding Horizontal`
  EdgeInsets get pH8 => EdgeInsets.symmetric(horizontal: _sizes.s8);
  EdgeInsets get pH10 => EdgeInsets.symmetric(horizontal: _sizes.s10);
  EdgeInsets get pH16 => EdgeInsets.symmetric(horizontal: _sizes.s16);
  EdgeInsets get pH24 => EdgeInsets.symmetric(horizontal: _sizes.s24);

  /// `Padding Vertical`
  EdgeInsets get pV16 => EdgeInsets.symmetric(vertical: _sizes.s16);
  EdgeInsets get pV24 => EdgeInsets.symmetric(vertical: _sizes.s24);
  EdgeInsets get pV48 => EdgeInsets.symmetric(vertical: _sizes.s48);

  /// `Padding Left/Right`
  EdgeInsets get pL24R16 =>
      EdgeInsets.only(left: _sizes.s24, right: _sizes.s16);
  EdgeInsets get pL8 => EdgeInsets.only(left: _sizes.s8);

  /// `Padding Horizontal/Vertical`
  EdgeInsets get pH4V2 =>
      EdgeInsets.symmetric(horizontal: _sizes.s4, vertical: _sizes.s2);
}
