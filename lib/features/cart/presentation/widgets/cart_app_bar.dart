import 'package:evira/core/utils/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/components/base_app_bar.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/intl_extension.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      hasLeading: false,
      title: context.l10n.cart,
      actions: [
        Badge(
          label: const Text('3'),
          backgroundColor: context.colorScheme.primary,
          offset: const Offset(-7, 7),
          child: IconButton(
            onPressed: () => debugPrint('Delete pressed'),
            icon: const CustomIcon(icon: AssetsConst.delete),
            tooltip: 'Remove all',
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
