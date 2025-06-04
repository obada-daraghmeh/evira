import '../../domain/entities/menu_option.dart';

class MenuOptionModel extends MenuOption {
  const MenuOptionModel({
    required super.leading,
    required super.title,
    super.profileAction,
    super.settingAction,
  });
}
