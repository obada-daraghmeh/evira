part of 'menu_option_cubit.dart';

sealed class MenuOptionState extends Equatable {
  const MenuOptionState();

  @override
  List<Object> get props => [];
}

final class MenuOptionInitial extends MenuOptionState {}

final class MenuOptionLoaded extends MenuOptionState {
  final List<MenuOption> profileMenuOptions;
  final List<MenuOption> settingMenuOptions;

  const MenuOptionLoaded({
    required this.profileMenuOptions,
    required this.settingMenuOptions,
  });

  @override
  List<Object> get props => [profileMenuOptions, settingMenuOptions];
}
