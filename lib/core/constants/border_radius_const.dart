import 'package:flutter/material.dart';

import 'sizes_const.dart';

class BorderRadiusConst {
  const BorderRadiusConst();

  final _sizes = const SizesConst();

  BorderRadius get radius2 => BorderRadius.all(Radius.circular(_sizes.s2));
  BorderRadius get radius4 => BorderRadius.all(Radius.circular(_sizes.s4));
  BorderRadius get radius6 => BorderRadius.all(Radius.circular(_sizes.s6));
  BorderRadius get radius8 => BorderRadius.all(Radius.circular(_sizes.s8));
  BorderRadius get radius12 => BorderRadius.all(Radius.circular(_sizes.s12));
  BorderRadius get radius16 => BorderRadius.all(Radius.circular(_sizes.s16));
  BorderRadius get radius20 => BorderRadius.all(Radius.circular(_sizes.s20));
  BorderRadius get radius24 => BorderRadius.all(Radius.circular(_sizes.s24));
  BorderRadius get radius30 => BorderRadius.all(Radius.circular(_sizes.s30));
  BorderRadius get radius40 => BorderRadius.all(Radius.circular(_sizes.s40));
}
