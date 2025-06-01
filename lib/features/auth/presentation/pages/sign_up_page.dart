import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared/components/base_app_bar.dart';
import '../../../../core/shared/components/email_text_field.dart';
import '../../../../core/shared/components/loading_button.dart';
import '../../../../core/shared/components/name_text_field.dart';
import '../../../../core/shared/components/password_text_field.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/formatters/formatter.dart';
import '../../../../core/utils/helpers/show_toast.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: SingleChildScrollView(
        padding: context.padding.pH24,
        physics: const BouncingScrollPhysics(),
        child: Column(
          spacing: context.spacing.s24,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthHeader(title: context.l10n.signUpTitle),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  ShowToast.showErrorToast(message: state.message);
                }
              },
              builder: (context, state) {
                final bool isLoading = state is AuthLoading;
                return Form(
                  key: _formKey,
                  child: Column(
                    spacing: context.spacing.s24,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      NameTextField(controller: _usernameController),
                      EmailTextField(controller: _emailController),
                      PasswordTextField(controller: _passwordController),
                      PasswordTextField(
                        controller: _confirmPasswordController,
                        confirmAgainst: _passwordController,
                        isConfirm: true,
                        label: context.l10n.confirmPassword,
                        hint: context.l10n.reEnterYourPassword,
                      ),
                      LoadingButton(
                        text: context.l10n.signUp,
                        isLoading: isLoading,
                        loaderColor: context.colorScheme.primary,
                        onPressed: isLoading
                            ? null
                            : () async {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                context.read<AuthBloc>().add(
                                  AuthSignUp(
                                    username: Formatter.trimLower(
                                      _usernameController.text,
                                    ),
                                    email: Formatter.trimLower(
                                      _emailController.text,
                                    ),
                                    password: _passwordController.text,
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                );
              },
            ),
            AuthFooter(
              promptText: context.l10n.signUpPrompt,
              actionText: context.l10n.signIn,
              onRedirectPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
