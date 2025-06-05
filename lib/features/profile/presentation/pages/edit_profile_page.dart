import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/shared/components/base_app_bar.dart';
import '../../../../core/shared/components/loading_button.dart';
import '../../../../core/shared/components/name_text_field.dart';
import '../../../../core/utils/extensions/auth_state_extension.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/helpers/show_toast.dart';
import '../controllers/profile/profile_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController(text: context.currentUser.username);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>(),
      child: Scaffold(
        appBar: BaseAppBar(title: context.l10n.editProfile),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: context.padding.pH24,
            child: BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is ProfileFailure) {
                  ShowToast.showErrorToast(message: state.message);
                }

                if (state is ProfileLoaded) {
                  ShowToast.showSuccessToast(
                    message: context.l10n.titleUpdatedSuccessfully(
                      context.l10n.profile,
                    ),
                  );
                  context.pop();
                }
              },
              builder: (context, state) {
                final bool isLoading = state is ProfileLoading;
                return Column(
                  spacing: context.spacing.s24,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    NameTextField(controller: _nameController),
                    LoadingButton(
                      text: context.l10n.update,
                      isLoading: isLoading,
                      loaderColor: context.colorScheme.primary,
                      onPressed: isLoading
                          ? null
                          : () async {
                              if (!_formKey.currentState!.validate()) return;
                              context.read<ProfileBloc>().add(
                                EditProfile(username: _nameController.text),
                              );
                            },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
