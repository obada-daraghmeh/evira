import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/components/error_message.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../cubit/navigation_cubit.dart';
import '../widgets/navigation_app_bar.dart';
import '../widgets/navigation_bar_item.dart';

class NavigationPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const NavigationPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NavigationCubit>()..fetchNavigations,
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state is! NavigationLoaded) {
            return const Scaffold(body: ErrorMessage());
          }

          final currentIndex = navigationShell.currentIndex;
          final pages = state.pagesType;
          final bottomBarItems = state.bottomBarItems;

          return Scaffold(
            appBar: navigationAppBar(pages[currentIndex]),
            body: navigationShell,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                navigationShell.goBranch(index);
              },
              items: bottomBarItems
                  .map(
                    (item) => navigationBarItem(
                      context,
                      label: item.label,
                      icon: item.icon,
                      activeIcon: item.activeIcon,
                    ),
                  )
                  .toList(),
              type: BottomNavigationBarType.shifting,
              selectedItemColor: context.colorScheme.primary,
              unselectedItemColor: context.colorScheme.onSurfaceVariant
                  .withValues(alpha: 0.6),
            ),
          );
        },
      ),
    );
  }
}
