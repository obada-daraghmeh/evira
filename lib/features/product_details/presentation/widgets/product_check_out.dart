import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/intl_extension.dart';

class ProductCheckOut extends StatelessWidget {
  const ProductCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        fixedSize: const Size.fromHeight(58.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      label: Text(context.l10n.checkout),
      icon: CustomIcon(icon: AssetsConst.arrowRightBold),
      iconAlignment: IconAlignment.end,
    );
  }
}
