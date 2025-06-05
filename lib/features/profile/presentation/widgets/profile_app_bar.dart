import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/components/base_app_bar.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/intl_extension.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      hasLeading: false,
      title: context.l10n.profile,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const CustomIcon(icon: AssetsConst.more),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
