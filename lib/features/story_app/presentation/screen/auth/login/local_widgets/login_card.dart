// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of '../login_screen.dart';

class LoginCard extends HookWidget {
  ValueNotifier<bool> isVisible;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function() onNavigateToRegister;
  final void Function() onLoginUser;

  LoginCard({
    Key? key,
    required this.isVisible,
    required this.emailController,
    required this.passwordController,
    required this.onNavigateToRegister,
    required this.onLoginUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          _buildHeader(context),
          const SizedBox(height: 24),
          _buildEmailField(context),
          const SizedBox(height: 16),
          _buildPasswordField(context),
          const SizedBox(height: 24),
          _buildLoginButton(context),
          const SizedBox(height: 16),
          _buildNavigateToRegister(context),
        ],
      ),
    ).animate().fade(duration: 500.ms).scale(delay: 500.ms);
  }

  Widget _buildHeader(BuildContext context) {
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

  Widget _buildEmailField(context) {
    return PlatformTextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
      validator: (value) => Utils().validateEmail(value),
      material: (context, platform) {
        return MaterialTextFormFieldData(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: AppLocalizations.of(context)!.hintEmail,
            label: Text(AppLocalizations.of(context)!.labelEmail),
            prefixIcon: const Icon(Icons.mail),
          ),
        );
      },
      cupertino: (context, platform) {
        return CupertinoTextFormFieldData(
          decoration: const BoxDecoration(),
          prefix: const Icon(CupertinoIcons.mail_solid),
        );
      },
    );
  }

  Widget _buildPasswordField(context) {
    return PlatformTextFormField(
      controller: passwordController,
      obscureText: !isVisible.value,
      validator: (value) => Utils().validatePassword(value),
      keyboardType: TextInputType.visiblePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
      material: (context, platoform) {
        return MaterialTextFormFieldData(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: AppLocalizations.of(context)!.hintPassword,
            label: Text(AppLocalizations.of(context)!.labelPassword),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () {
                isVisible.value = !isVisible.value;
                Utils().togglePasswordVisibility(isVisible.value);
              },
              icon: Icon(
                isVisible.value ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        );
      },
      cupertino: (context, platform) {
        return CupertinoTextFormFieldData(
          decoration: const BoxDecoration(),
          prefix: const Icon(CupertinoIcons.lock_fill),
        );
      },
    );
  }

  Widget _buildLoginButton(context) {
    return SizedBox(
      width: double.maxFinite,
      child: PlatformElevatedButton(
        onPressed: () => onLoginUser(),
        child: Text(AppLocalizations.of(context)!.login),
      ),
    );
  }

  Widget _buildNavigateToRegister(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppLocalizations.of(context)!.alreadyHaveAnAccount),
        const SizedBox(width: 8.0),
        PlatformTextButton(
          onPressed: () => onNavigateToRegister(),
          child: Text(AppLocalizations.of(context)!.register),
        )
      ],
    );
  }
}
