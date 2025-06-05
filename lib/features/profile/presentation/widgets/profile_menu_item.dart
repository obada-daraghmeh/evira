import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/constants/routes_const.dart';
import '../../../../core/shared/components/bottom_sheet_container.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../domain/entities/menu_option.dart';
import 'logout_bottom_sheet.dart';

class ProfileMenuItem extends StatelessWidget {
  final int index;
  final int length;
  final MenuOption option;

  const ProfileMenuItem({
    super.key,
    required this.index,
    required this.length,
    required this.option,
  });

  bool get isDestructive => index == length - 1;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomIcon(
        icon: option.leading,
        customColor: isDestructive ? context.colorScheme.error : null,
      ),
      title: Text(
        option.title,
        style: isDestructive
            ? TextStyle(color: context.colorScheme.error)
            : null,
      ),
      trailing: isDestructive
          ? null
          : const CustomIcon(icon: AssetsConst.chevronRight),
      contentPadding: context.padding.pH16,
      shape: RoundedRectangleBorder(
        borderRadius: context.borderRadius.borderRadius16,
      ),
      onTap: () => _handleTap(context),
    );
  }

  void _handleTap(BuildContext context) {
    switch (option.profileAction) {
      case ProfileMenuAction.profile:
        context.pushNamed(RoutesConst.editProfile);
        break;
      case ProfileMenuAction.settings:
        context.pushNamed(RoutesConst.settings);
        break;
      case ProfileMenuAction.logout:
        _showLogoutSheet(context);
        break;
      case ProfileMenuAction.address:
      case ProfileMenuAction.payments:
      case ProfileMenuAction.security:
      case ProfileMenuAction.privacyPolicy:
      case ProfileMenuAction.helpCenter:
      case ProfileMenuAction.inviteFriends:
        break;
      case null:
        throw UnimplementedError('Profile action is null');
    }
  }

  void _showLogoutSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: context.borderRadius.borderRadiusVT24,
      ),
      backgroundColor: context.colorScheme.surface,
      builder: (_) => const BottomSheetContainer(
        hasBottomPadding: true,
        child: LogoutBottomSheet(),
      ),
    );
  }
}
