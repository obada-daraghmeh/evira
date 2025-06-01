import '../../../../core/constants/assets_const.dart';
import '../../../../core/localization/generated/l10n.dart';
import '../../domain/entities/navigation_page_type.dart';
import '../models/bottom_bar_item_model.dart';

abstract class NavigationLocalDataSource {
  List<NavigationPageType> get pagesType;
  List<BottomBarItemModel> get bottomBarItems;
}

class NavigationLocalDataSourceImpl implements NavigationLocalDataSource {
  final _intl = FlutterIntl.current;

  @override
  List<NavigationPageType> get pagesType => [
    NavigationPageType.home,
    NavigationPageType.cart,
    NavigationPageType.orders,
    NavigationPageType.wallet,
    NavigationPageType.profile,
  ];

  @override
  List<BottomBarItemModel> get bottomBarItems => [
    BottomBarItemModel(
      label: _intl.home,
      icon: AssetsConst.home,
      activeIcon: AssetsConst.homeBold,
    ),
    BottomBarItemModel(
      label: _intl.cart,
      icon: AssetsConst.cart,
      activeIcon: AssetsConst.cartBold,
    ),
    BottomBarItemModel(
      label: _intl.orders,
      icon: AssetsConst.buy,
      activeIcon: AssetsConst.buyBold,
    ),
    BottomBarItemModel(
      label: _intl.wallet,
      icon: AssetsConst.wallet,
      activeIcon: AssetsConst.walletBold,
    ),
    BottomBarItemModel(
      label: _intl.profile,
      icon: AssetsConst.profile,
      activeIcon: AssetsConst.profileBold,
    ),
  ];
}
