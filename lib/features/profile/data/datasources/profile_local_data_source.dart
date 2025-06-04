import '../../../../core/constants/assets_const.dart';
import '../../../../core/localization/generated/l10n.dart';
import '../../domain/entities/menu_option.dart';
import '../models/menu_option_model.dart';

abstract class ProfileLocalDataSource {
  List<MenuOptionModel> get profileMenuOptions;
  List<MenuOptionModel> get settingMenuOptions;
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final _intl = FlutterIntl.current;

  @override
  List<MenuOptionModel> get profileMenuOptions => [
    MenuOptionModel(
      leading: AssetsConst.profile,
      title: _intl.editProfile,
      profileAction: ProfileMenuAction.profile,
    ),
    MenuOptionModel(
      leading: AssetsConst.location,
      title: _intl.address,
      profileAction: ProfileMenuAction.address,
    ),
    MenuOptionModel(
      leading: AssetsConst.wallet,
      title: _intl.payments,
      profileAction: ProfileMenuAction.payments,
    ),
    MenuOptionModel(
      leading: AssetsConst.shieldDone,
      title: _intl.security,
      profileAction: ProfileMenuAction.security,
    ),
    MenuOptionModel(
      leading: AssetsConst.setting,
      title: _intl.settings,
      profileAction: ProfileMenuAction.settings,
    ),
    MenuOptionModel(
      leading: AssetsConst.lock,
      title: _intl.privacyPolicy,
      profileAction: ProfileMenuAction.privacyPolicy,
    ),
    MenuOptionModel(
      leading: AssetsConst.info,
      title: _intl.helpCenter,
      profileAction: ProfileMenuAction.helpCenter,
    ),
    MenuOptionModel(
      leading: AssetsConst.multiUser,
      title: _intl.inviteFriends,
      profileAction: ProfileMenuAction.inviteFriends,
    ),
    MenuOptionModel(
      leading: AssetsConst.logout,
      title: _intl.logout,
      profileAction: ProfileMenuAction.logout,
    ),
  ];

  @override
  List<MenuOptionModel> get settingMenuOptions => [
    MenuOptionModel(
      leading: AssetsConst.notification,
      title: _intl.notifications,
      settingAction: SettingMenuAction.notifications,
    ),
    MenuOptionModel(
      leading: AssetsConst.language,
      title: _intl.language,
      settingAction: SettingMenuAction.language,
    ),
    MenuOptionModel(
      leading: AssetsConst.eye,
      title: _intl.themeMode,
      settingAction: SettingMenuAction.themeMode,
    ),
  ];
}
