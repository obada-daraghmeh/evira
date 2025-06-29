import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/custom_network_image.dart';
import '../../../../../core/utils/extensions/constants_extension.dart';
import '../../../../../core/utils/extensions/media_query_extension.dart';

class ImagePreview extends StatelessWidget {
  final int index;
  final List<String> imageUrls;

  const ImagePreview({super.key, required this.index, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeInOut,
      child: Container(
        key: ValueKey<int>(index),
        width: context.sWidth,
        height: context.sWidth * 0.8,
        padding: context.padding.pT56B16,
        child: CustomNetworkImage(
          imageUrl: imageUrls[index],
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
