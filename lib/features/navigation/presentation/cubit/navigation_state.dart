part of 'navigation_cubit.dart';

sealed class NavigationState extends Equatable {
  final int index;
  const NavigationState(this.index);

  @override
  List<Object> get props => [index];
}

final class NavigationInitial extends NavigationState {
  const NavigationInitial() : super(0);
}

final class NavigationLoaded extends NavigationState {
  final List<NavigationPageType> pagesType;
  final List<BottomBarItem> bottomBarItems;

  const NavigationLoaded(
    super.index, {
    required this.pagesType,
    required this.bottomBarItems,
  });

  @override
  List<Object> get props => [index, pagesType, bottomBarItems];
}
