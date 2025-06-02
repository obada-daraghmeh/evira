import 'package:flutter/material.dart';

import '../../constants/assets_const.dart';
import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/theme_extension.dart';
import '../widgets/custom_icon.dart';
import '../widgets/custom_network_image.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final double? size;
  final bool isEditable;
  final void Function()? onPressed;

  const Avatar({
    super.key,
    this.imageUrl,
    this.size,
    this.isEditable = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final avatarSize = size ?? context.spacing.s48;
    final iconSize = size != null
        ? (size! - context.spacing.s8)
        : context.iconSize.lg;

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: avatarSize,
          width: avatarSize,
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHighest,
            shape: BoxShape.circle,
          ),
          child: imageUrl != null
              ? ClipOval(
                  child: CustomNetworkImage(
                    imageUrl: imageUrl!,
                    size: avatarSize,
                    skeltonBorderRadius: avatarSize,
                  ),
                )
              : null,
        ),
        if (imageUrl == null)
          Positioned(
            bottom: 0,
            child: CustomIcon(icon: AssetsConst.profileBold, size: iconSize),
          ),
        if (isEditable)
          Positioned(
            bottom: -context.spacing.s10,
            right: -context.spacing.s10,
            child: IconButton(
              onPressed: onPressed,
              icon: CustomIcon(
                icon: AssetsConst.editBold,
                size: context.iconSize.lg,
                // customColor: context.colorScheme.onSurface,
              ),
            ),
          ),
      ],
    );
  }
}
