import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/custom_animated_list.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../domain/entities/menu_option.dart';
import '../controllers/menu_option/menu_option_cubit.dart';
import 'profile_menu_item.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuOptionCubit, MenuOptionState>(
      builder: (context, state) {
        if (state is MenuOptionLoaded) {
          final options = state.profileMenuOptions;

          return Expanded(
            child: Padding(
              padding: context.padding.pH8,
              child: CustomAnimatedList<MenuOption>(
                items: options,
                itemBuilder: (context, index, option) {
                  return ProfileMenuItem(
                    index: index,
                    length: options.length,
                    option: option,
                  );
                },
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
