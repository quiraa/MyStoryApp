// ignore_for_file: must_be_immutable

import 'package:dicoding_story_app/app/di/injection_container.dart';
import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/core/utils/utils.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/login/login_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/login/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

part 'local_widgets/login_card.dart';
part 'local_widgets/login_scaffold.dart';

class LoginScreen extends HookWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var isVisible = useState(false);
    return BlocProvider<LoginCubit>(
      create: (context) => sl(),
      child: LoginScaffold(
        loginCard: LoginCard(
          isVisible: isVisible,
          emailController: emailController,
          passwordController: passwordController,
          onNavigateToRegister: () => router.goNamed(PAGES.register.screenName),
          onLoginUser: () {
            context.read<LoginCubit>().postLoginUser(emailController.text, passwordController.text);
          },
        ),
        loginBloc: BlocConsumer<LoginCubit, LoginState>(
          builder: (context, state) {
            return state.when(
              init: () => const SizedBox(),
              loading: () => Center(child: PlatformCircularProgressIndicator()),
              success: () => const SizedBox(),
              error: (erorr, message) => Center(
                child: Text(message),
              ),
            );
          },
          listener: (context, state) {
            state.whenOrNull(
              success: () => router.goNamed(PAGES.main.screenName),
            );
          },
        ),
      ),
    );
  }
}
