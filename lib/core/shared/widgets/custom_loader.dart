import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/assets_const.dart';
import '../../utils/extensions/theme_extension.dart';

class CustomLoader extends StatelessWidget {
  final Color? color;
  const CustomLoader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          color ?? context.colorScheme.primary,
          BlendMode.srcIn,
        ),
        child: Lottie.asset(AssetsConst.loader),
      ),
    );
  }
}
