import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/auth_state_extension.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import 'profile_avatar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileAvatar(),
        SizedBox(height: context.spacing.s16),
        Text(
          context.currentUser.username,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(context.currentUser.email),
        SizedBox(height: context.spacing.s16),
        const Divider(),
      ],
    );
  }
}
