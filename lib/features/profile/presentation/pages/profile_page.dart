import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/routes_const.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../controllers/menu_option/menu_option_cubit.dart';
import '../controllers/profile/profile_bloc.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProfileBloc>()),
        BlocProvider(
          create: (_) => getIt<MenuOptionCubit>()..fetchProfileMenuOptions,
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            context.goNamed(RoutesConst.signIn);
          }
        },
        child: const Column(children: [ProfileHeader(), ProfileMenu()]),
      ),
    );
  }
}
