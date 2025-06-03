import 'package:flutter/widgets.dart';

import '../../../../../core/shared/widgets/custom_network_image.dart';
import '../../../../../core/utils/extensions/constants_extension.dart';
import '../../../../../core/utils/extensions/theme_extension.dart';

class CartCardImage extends StatelessWidget {
  final String imageUrl;
  const CartCardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainerHighest,
          borderRadius: context.borderRadius.borderRadius16,
        ),
        child: CustomNetworkImage(imageUrl: imageUrl, fit: BoxFit.contain),
      ),
    );
  }
}
