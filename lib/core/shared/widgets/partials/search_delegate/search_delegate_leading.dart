import 'package:flutter/material.dart';

import '../../../../constants/assets_const.dart';
import '../../../../utils/extensions/constants_extension.dart';
import '../../../../utils/extensions/intl_extension.dart';
import '../../custom_icon.dart';

class SearchDelegateLeading extends StatelessWidget {
  final VoidCallback onPressed;
  const SearchDelegateLeading({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.pL8,
      child: IconButton(
        icon: const CustomIcon(icon: AssetsConst.arrowLeftBold),
        onPressed: onPressed,
        tooltip: context.l10n.back,
      ),
    );
  }
}
