import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/controllers/category/category_bloc.dart';
import '../../../../core/controllers/product/product_bloc.dart';
import '../../../../core/controllers/theme_mode/theme_mode_cubit.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/components/loading_button.dart';
import '../../../../core/shared/components/section_header.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../widgets/category_section.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_offers_slider.dart';
import '../widgets/product_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CategoryBloc>()..add(FetchCategories()),
        ),
        BlocProvider(
          create: (_) => getIt<ProductBloc>()..add(ProductsFetched()),
        ),
      ],
      child: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: context.padding.pH24,
              child: Column(
                spacing: context.spacing.s24,
                children: [
                  SectionHeader(
                    title: context.l10n.specialOffers,
                    showSeeAll: true,
                  ),
                  const HomeOffersSlider(),
                  const CategorySection(),
                  SectionHeader(
                    title: context.l10n.mostPopular,
                    showSeeAll: true,
                  ),
                  const ProductSection(),
                  // Temp widgets for test
                  Switch(
                    value:
                        context.watch<ThemeModeCubit>().state == ThemeMode.dark,
                    onChanged: (value) {
                      context.read<ThemeModeCubit>().toggleThemeMode;
                    },
                  ),
                  LoadingButton(
                    text: 'logout',
                    onPressed: () =>
                        context.read<AuthBloc>().add(AuthSignOut()),
                    isLoading: context.read<AuthBloc>().state is AuthLoading,
                    height: context.spacing.s48,
                    backgroundColor: context.colorScheme.error,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
