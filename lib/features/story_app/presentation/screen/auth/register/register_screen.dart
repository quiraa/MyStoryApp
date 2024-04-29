import 'package:dicoding_story_app/app/di/injection_container.dart';
import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/core/utils/utils.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/register/register_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/register/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

part 'local_widgets/register_card.dart';
part 'local_widgets/register_scaffold.dart';

class RegisterScreen extends HookWidget {
  RegisterScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var isVisible = useState(false);
    return BlocProvider<RegisterCubit>(
      create: (context) => sl(),
      child: RegisterScaffold(
        registerCard: RegisterCard(
          isVisible: isVisible,
          nameController: nameController,
          emailController: emailController,
          passwordController: passwordController,
          onNavigateToLogin: () => router.goNamed(PAGES.login.screenName),
          onRegisterUser: () {
            context.read<RegisterCubit>()
              ..postUserRegistration(
                  nameController.text, emailController.text, passwordController.text);
          },
        ),
        registerBloc: BlocConsumer<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return state.when(
              init: () => const SizedBox(),
              loading: () => Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              success: (responseData) => const SizedBox(),
              error: (error, message) => Center(
                child: Text(message),
              ),
            );
          },
          listener: (context, state) {
            state.whenOrNull(
              success: (responseData) => router.goNamed(PAGES.login.screenName),
            );
          },
        ),
      ),
    );
  }
}
