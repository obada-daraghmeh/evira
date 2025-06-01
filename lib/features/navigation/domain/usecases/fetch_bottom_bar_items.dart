import '../../../../core/services/get_it_service.dart';
import '../entities/bottom_bar_item.dart';
import '../repositories/navigation_repository.dart';

class FetchBottomBarItemsUseCase {
  List<BottomBarItem> call() => getIt<NavigationRepository>().bottomBarItems;
}
