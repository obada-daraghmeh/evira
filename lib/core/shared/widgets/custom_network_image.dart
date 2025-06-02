import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/assets_const.dart';
import '../../utils/extensions/theme_extension.dart';
import 'custom_icon.dart';
import 'custom_skeleton.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? size;
  final BoxFit? fit;
  final double? skeltonBorderRadius;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.size = 50.0,
    this.fit,
    this.skeltonBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => _placeholder(context),
      errorWidget: (context, url, error) => _errorWidget(context),
      fit: fit ?? BoxFit.cover,
      width: size,
      height: size,
    );
  }

  Stack _placeholder(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomSkeleton(
          width: size,
          height: size,
          borderRadius: skeltonBorderRadius,
        ),
        CustomIcon(
          icon: AssetsConst.imageBold,
          customColor: context.colorScheme.onSurface.withValues(alpha: 0.1),
          size: (size! / 2),
        ),
      ],
    );
  }

  CustomIcon _errorWidget(BuildContext context) {
    return CustomIcon(
      icon: AssetsConst.imageBrokenBold,
      customColor: context.colorScheme.error,
    );
  }
}
