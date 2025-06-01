import '../entities/bottom_bar_item.dart';
import '../entities/navigation_page_type.dart';

abstract class NavigationRepository {
  List<NavigationPageType> get pagesType;
  List<BottomBarItem> get bottomBarItems;
}
