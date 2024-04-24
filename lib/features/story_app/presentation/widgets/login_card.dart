import 'package:dicoding_story_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginCard extends HookWidget {
  final BuildContext context;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function() onNavigateToRegister;
  final void Function() onLoginUser;

  const LoginCard({
    super.key,
    required this.context,
    required this.emailController,
    required this.passwordController,
    required this.onNavigateToRegister,
    required this.onLoginUser,
  });

  @override
  Widget build(BuildContext context) {
    final isVisible = useState<bool>(false);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(-2, 8),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildEmailField(),
          const SizedBox(height: 16),
          _buildPasswordField(isVisible),
          const SizedBox(height: 24),
          _buildLoginButton(context),
          const SizedBox(height: 16),
          _buildNavigateToRegister(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Text(
        AppLocalizations.of(context)!.login,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
      validator: (value) => Utils().validateEmail(value),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: AppLocalizations.of(context)!.hintEmail,
        label: Text(AppLocalizations.of(context)!.labelEmail),
        prefixIcon: const Icon(Icons.mail),
      ),
    );
  }

  TextFormField _buildPasswordField(
    ValueNotifier<bool> isVisible,
  ) {
    return TextFormField(
      controller: passwordController,
      obscureText: !isVisible.value,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: AppLocalizations.of(context)!.hintPassword,
        label: Text(AppLocalizations.of(context)!.labelPassword),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () => Utils().togglePasswordVisibility(isVisible),
          icon: Icon(
            isVisible.value ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      validator: (value) => Utils().validatePassword(value),
      keyboardType: TextInputType.visiblePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: FilledButton(
        onPressed: () {
          onLoginUser();
        },
        child: Text(
          AppLocalizations.of(context)!.login,
        ),
      ),
    );
  }

  Widget _buildNavigateToRegister(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppLocalizations.of(context)!.alreadyHaveAnAccount),
        const SizedBox(
          width: 8.0,
        ),
        TextButton(
          onPressed: () {
            onNavigateToRegister();
          },
          child: Text(AppLocalizations.of(context)!.register),
        )
      ],
    );
  }
}
