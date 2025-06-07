import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/routes_const.dart';
import '../../../../core/shared/components/email_text_field.dart';
import '../../../../core/shared/components/loading_button.dart';
import '../../../../core/shared/components/password_text_field.dart';
import '../../../../core/utils/extensions/constants_extension.dart';
import '../../../../core/utils/extensions/intl_extension.dart';
import '../../../../core/utils/extensions/theme_extension.dart';
import '../../../../core/utils/helpers/show_toast.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/remember_me.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: context.padding.pH24,
                child: Column(
                  spacing: context.spacing.s24,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthHeader(title: context.l10n.signInTitle),
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
                              EmailTextField(controller: _emailController),
                              PasswordTextField(
                                controller: _passwordController,
                              ),
                              const RememberMe(),
                              LoadingButton(
                                text: context.l10n.signIn,
                                isLoading: isLoading,
                                loaderColor: context.colorScheme.primary,
                                onPressed: isLoading
                                    ? null
                                    : () async {
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          return;
                                        }
                                        context.read<AuthBloc>().add(
                                          AuthSignIn(
                                            email: _emailController.text,
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
                    Center(
                      child: TextButton(
                        onPressed: () => debugPrint('forgot password'),
                        child: Text(context.l10n.forgotPassword),
                      ),
                    ),
                    AuthFooter(
                      promptText: context.l10n.signInPrompt,
                      actionText: context.l10n.signUp,
                      onRedirectPressed: () =>
                          context.pushNamed(RoutesConst.signUp),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
