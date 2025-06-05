import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/controllers/theme_mode/theme_mode_cubit.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../domain/entities/menu_option.dart';

class SettingsMenuItem extends StatelessWidget {
  final int index;
  final int length;
  final MenuOption option;

  const SettingsMenuItem({
    super.key,
    required this.index,
    required this.length,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomIcon(icon: option.leading),
      title: Text(option.title),
      trailing: _buildTrailing(context),
      contentPadding: context.padding.pH16,
      shape: RoundedRectangleBorder(
        borderRadius: context.borderRadius.borderRadius16,
      ),
      onTap: () {},
    );
  }

  Widget? _buildTrailing(BuildContext context) {
    final title = option.title.toLowerCase();

    if (title == 'language') {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('English', style: context.textTheme.bodyLarge),
          SizedBox(width: context.spacing.s8),
          const CustomIcon(icon: AssetsConst.chevronRight),
        ],
      );
    }

    if (title == 'theme mode') {
      return Switch(
        value: context.watch<ThemeModeCubit>().state == ThemeMode.dark,
        onChanged: (value) => context.read<ThemeModeCubit>().toggleThemeMode,
      );
    }

    return const CustomIcon(icon: AssetsConst.chevronRight);
  }
}
