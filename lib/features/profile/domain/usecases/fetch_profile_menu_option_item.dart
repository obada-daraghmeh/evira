import '../../../../core/services/get_it_service.dart';
import '../entities/menu_option.dart';
import '../repositories/profile_repository.dart';

class FetchProfileMenuOptionUseCase {
  List<MenuOption> call() => getIt<ProfileRepository>().profileMenuOptions;
}
