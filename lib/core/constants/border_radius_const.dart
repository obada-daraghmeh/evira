import 'package:flutter/material.dart';

import 'sizes_const.dart';

class BorderRadiusConst {
  const BorderRadiusConst();

  final _sizes = const SizesConst();

  /// `Radius`
  Radius get radius2 => Radius.circular(_sizes.s2);
  Radius get radius4 => Radius.circular(_sizes.s4);
  Radius get radius6 => Radius.circular(_sizes.s6);
  Radius get radius8 => Radius.circular(_sizes.s8);
  Radius get radius12 => Radius.circular(_sizes.s12);
  Radius get radius16 => Radius.circular(_sizes.s16);
  Radius get radius20 => Radius.circular(_sizes.s20);
  Radius get radius24 => Radius.circular(_sizes.s24);
  Radius get radius30 => Radius.circular(_sizes.s30);
  Radius get radius40 => Radius.circular(_sizes.s40);

  /// `BorderRadius`
  BorderRadius get borderRadius2 => BorderRadius.all(radius2);
  BorderRadius get borderRadius4 => BorderRadius.all(radius4);
  BorderRadius get borderRadius6 => BorderRadius.all(radius6);
  BorderRadius get borderRadius8 => BorderRadius.all(radius8);
  BorderRadius get borderRadius12 => BorderRadius.all(radius12);
  BorderRadius get borderRadius16 => BorderRadius.all(radius16);
  BorderRadius get borderRadius20 => BorderRadius.all(radius20);
  BorderRadius get borderRadius24 => BorderRadius.all(radius24);
  BorderRadius get borderRadius30 => BorderRadius.all(radius30);
  BorderRadius get borderRadius40 => BorderRadius.all(radius40);
}
