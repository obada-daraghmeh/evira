import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/components/search_text_field.dart';
import '../../../../core/shared/widgets/custom_icon.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const CustomIcon(icon: AssetsConst.arrowLeftBold),
        onPressed: () => context.pop(),
      ),
      title: const SearchTextField(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
