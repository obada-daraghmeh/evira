import 'package:equatable/equatable.dart';

enum ProfileMenuAction {
  profile,
  address,
  payments,
  settings,
  security,
  privacyPolicy,
  helpCenter,
  inviteFriends,
  logout,
}

enum SettingMenuAction { themeMode, language, notifications }

class MenuOption extends Equatable {
  final String leading;
  final String title;
  final ProfileMenuAction? profileAction;
  final SettingMenuAction? settingAction;

  const MenuOption({
    required this.leading,
    required this.title,
    this.profileAction,
    this.settingAction,
  });

  @override
  List<Object?> get props => [leading, title, profileAction, settingAction];
}
