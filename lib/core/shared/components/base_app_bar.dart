import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/assets_const.dart';
import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/intl_extension.dart';
import '../../utils/extensions/theme_extension.dart';
import '../../utils/formatters/formatter.dart';
import '../widgets/custom_icon.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool hasLeading;

  const BaseAppBar({
    super.key,
    this.hasLeading = true,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final safeTitle = (title?.trim().isNotEmpty ?? false)
        ? Formatter.upperFirst(title!.trim())
        : '';

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: hasLeading ? context.padding.pH10 : context.padding.pL24R16,
        child: SizedBox(
          height: kToolbarHeight,
          child: Row(
            spacing: hasLeading ? context.spacing.s8 : 0,
            children: [
              if (hasLeading) _buildBackButton(context),
              Expanded(
                child: Text(
                  safeTitle,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (actions != null && actions!.isNotEmpty) ...actions!,
            ],
          ),
        ),
      ),
    );
  }

  IconButton _buildBackButton(BuildContext context) {
    return IconButton(
      icon: const CustomIcon(icon: AssetsConst.arrowLeftBold),
      onPressed: () => context.pop(),
      tooltip: context.l10n.back,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
