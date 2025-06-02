import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/controllers/theme_mode/theme_mode_cubit.dart';
import '../../../../core/shared/components/loading_button.dart';
import '../../../../core/shared/components/section_header.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_offers_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                  onPressed: () => context.read<AuthBloc>().add(AuthSignOut()),
                  isLoading: context.read<AuthBloc>().state is AuthLoading,
                  height: context.spacing.s48,
                  backgroundColor: context.colorScheme.error,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
