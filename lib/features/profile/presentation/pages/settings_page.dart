import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/components/base_app_bar.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../controllers/menu_option/menu_option_cubit.dart';
import '../widgets/settings_menu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MenuOptionCubit>()..fetchSettingMenuOptions,
      child: Scaffold(
        appBar: BaseAppBar(title: context.l10n.settings),
        body: const SettingsMenu(),
      ),
    );
  }
}
