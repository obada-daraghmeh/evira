import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../constants/assets_const.dart';
import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/media_query_extension.dart';
import '../../utils/extensions/theme_extension.dart';
import '../widgets/custom_icon.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({super.key, this.message = 'Oops! Something went wrong'});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: context.borderRadius.radius24,
        color: context.colorScheme.outline,
      ),
      child: Container(
        width: context.sWidth,
        padding: context.padding.pV24,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomIcon(
              icon: AssetsConst.dangerBold,
              size: context.iconSize.lg,
              customColor: context.colorScheme.error,
            ),
            Text(
              message,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
