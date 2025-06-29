import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/custom_network_image.dart';
import '../../../../../core/utils/extensions/constants_extension.dart';
import '../../../../../core/utils/extensions/theme_extension.dart';

class ImageTypeSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final List<String> imageUrls;

  const ImageTypeSelector({
    super.key,
    required this.onTap,
    required this.imageUrls,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: imageUrls.length > 5 ? context.padding.pH8 : EdgeInsets.zero,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: context.spacing.s8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imageUrls.length,
            (index) => GestureDetector(
              onTap: () => onTap(index),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: Container(
                  key: ValueKey<int>(index),
                  width: context.spacing.s60,
                  height: context.spacing.s60,
                  padding: context.padding.p4,
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface.withValues(alpha: 125),
                    borderRadius: context.borderRadius.borderRadius8,
                    border: Border.all(
                      color: selectedIndex == index
                          ? context.colorScheme.primary
                          : context.colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                  child: CustomNetworkImage(
                    imageUrl: imageUrls[index],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
