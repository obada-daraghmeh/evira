import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/constants/routes_const.dart';
import '../../../../core/shared/components/avatar.dart';
import '../../../../core/shared/components/search_text_field.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/shared/widgets/custom_search_delegate.dart';
import '../../../../core/utils/extensions/auth_state_extension.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

const double kAppBarHeight = 150.0;

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return SliverAppBar(
      snap: true,
      pinned: true,
      floating: true,
      expandedHeight: kAppBarHeight,
      elevation: 4,
      backgroundColor: colorScheme.surface,
      shadowColor: colorScheme.primary.withAlpha(80),
      title: _buildTitle(context),
      flexibleSpace: _buildFlexibleSpace(context),
      shape: RoundedRectangleBorder(
        borderRadius: context.borderRadius.borderRadiusVB16,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final user = context.currentUser;
    final greeting = context.l10n.goodTimeOfDay(
      context.isAM ? context.l10n.morning : context.l10n.afternoon,
    );

    return Padding(
      padding: context.padding.pL8,
      child: Row(
        children: [
          Avatar(imageUrl: user.avatarUrl),
          SizedBox(width: context.spacing.s16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant.withAlpha(150),
                ),
              ),
              Text(user.username, style: context.textTheme.titleMedium),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const CustomIcon(icon: AssetsConst.notification),
            onPressed: () => debugPrint('Notification pressed'),
            tooltip: context.l10n.notifications,
          ),
          IconButton(
            icon: const CustomIcon(icon: AssetsConst.heart),
            onPressed: () => context.pushNamed(RoutesConst.wishlist),
            tooltip: context.l10n.wishlist,
          ),
        ],
      ),
    );
  }

  Widget _buildFlexibleSpace(BuildContext context) {
    return FlexibleSpaceBar(
      background: Padding(
        padding: context.padding.p24,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SearchTextField(
            absorbing: true,
            onTap: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);
}
