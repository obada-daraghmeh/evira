import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/components/loading_button.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AuthBloc>();
    return Column(
      spacing: context.spacing.s12,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomIcon(
          icon: AssetsConst.logout,
          size: context.iconSize.lg,
          customColor: context.colorScheme.error,
        ),
        Text(
          context.l10n.logout,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.error,
          ),
        ),
        Text(
          context.l10n.logoutHint,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: context.spacing.s12),
        Row(
          spacing: context.spacing.s12,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => context.pop(),
                style: OutlinedButton.styleFrom(
                  fixedSize: Size.fromHeight(context.spacing.s48),
                ),
                child: Text(context.l10n.cancel),
              ),
            ),
            Expanded(
              child: LoadingButton(
                text: context.l10n.logout,
                onPressed: () => controller.add(AuthSignOut()),
                isLoading: controller.state is AuthLoading,
                height: context.spacing.s48,
                backgroundColor: context.colorScheme.error,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
