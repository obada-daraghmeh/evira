import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/get_it_service.dart';
import '../../../domain/entities/menu_option.dart';
import '../../../domain/usecases/fetch_profile_menu_option_item.dart';
import '../../../domain/usecases/fetch_setting_menu_option_item.dart';

part 'menu_option_state.dart';

class MenuOptionCubit extends Cubit<MenuOptionState> {
  MenuOptionCubit() : super(MenuOptionInitial());

  void fetchProfileMenuOptions() {
    final profileMenu = getIt<FetchProfileMenuOptionUseCase>().call();
    emit(
      MenuOptionLoaded(profileMenuOptions: profileMenu, settingMenuOptions: []),
    );
  }

  void fetchSettingMenuOptions() {
    final settingMenu = getIt<FetchSettingMenuOptionUseCase>().call();
    emit(
      MenuOptionLoaded(profileMenuOptions: [], settingMenuOptions: settingMenu),
    );
  }
}
