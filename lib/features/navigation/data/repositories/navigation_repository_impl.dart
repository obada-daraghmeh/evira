import '../../../../core/services/get_it_service.dart';
import '../../domain/entities/bottom_bar_item.dart';
import '../../domain/entities/navigation_page_type.dart';
import '../../domain/repositories/navigation_repository.dart';
import '../datasources/navigation_local_data_source.dart';

class NavigationRepositoryImpl implements NavigationRepository {
  @override
  List<NavigationPageType> get pagesType =>
      getIt<NavigationLocalDataSource>().pagesType;

  @override
  List<BottomBarItem> get bottomBarItems =>
      getIt<NavigationLocalDataSource>().bottomBarItems;
}
