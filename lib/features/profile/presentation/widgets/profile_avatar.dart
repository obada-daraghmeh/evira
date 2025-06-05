import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/components/avatar.dart';
import '../../../../core/utils/extensions/auth_state_extension.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/helpers/image_picker.dart';
import '../../../../core/utils/helpers/show_toast.dart';
import '../controllers/profile/profile_bloc.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  Future<void> get _handlePickImage async {
    final file = await ImagePickerHelper.pickImageFromGallery;
    if (file != null && mounted) {
      final userId = context.currentUser.id;
      context.read<ProfileBloc>().add(
        UpdateProfileAvatar(userId: userId, file: file),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileFailure) {
          ShowToast.showErrorToast(message: state.message);
        } else if (state is ProfileAvatarUpdated) {
          ShowToast.showSuccessToast(
            message: context.l10n.titleUpdatedSuccessfully(context.l10n.avatar),
          );
        }
      },
      builder: (context, state) {
        final avatarUrl = (state is ProfileAvatarUpdated)
            ? state.url
            : context.currentUser.avatarUrl;

        return Avatar(
          isEditable: true,
          size: context.iconSize.xxl * 1.66,
          imageUrl: avatarUrl,
          onPressed: () => _handlePickImage,
        );
      },
    );
  }
}
