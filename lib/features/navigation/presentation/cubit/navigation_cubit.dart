import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../domain/entities/bottom_bar_item.dart';
import '../../domain/entities/navigation_page_type.dart';
import '../../domain/usecases/fetch_bottom_bar_items.dart';
import '../../domain/usecases/fetch_pages.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationInitial());

  void get fetchNavigations {
    final pagesType = getIt<FetchPagesUseCase>().call();
    final bottomBarItems = getIt<FetchBottomBarItemsUseCase>().call();

    emit(
      NavigationLoaded(
        state.index,
        pagesType: pagesType,
        bottomBarItems: bottomBarItems,
      ),
    );
  }
}
