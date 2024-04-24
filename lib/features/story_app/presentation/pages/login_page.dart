import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/login/login_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/login/login_state.dart';
import 'package:dicoding_story_app/features/story_app/presentation/widgets/login_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../bloc/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginCard(
                context: context,
                emailController: emailController,
                passwordController: passwordController,
                onNavigateToRegister: () => context.pushReplacementNamed(PAGES.register.screenName),
                onLoginUser: () {
                  if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                    final email = emailController.text.toString();
                    final password = passwordController.text.toString();
                    context.read<LoginBloc>().add(LoginUserEvent(email, password));
                  } else {
                    Fluttertoast.showToast(msg: 'Please fill all value');
                  }
                },
              ),
              const SizedBox(height: 32),
              BlocConsumer<LoginBloc, LoginState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case LoginIdleState:
                      return const SizedBox();

                    case LoginLoadingState:
                      return const CircularProgressIndicator();

                    case LoginErrorState:
                      return Center(
                        child: Text(state.error?.message ?? "Error Occurred"),
                      );

                    case LoginSuccessState:
                      return const SizedBox();

                    default:
                      return const SizedBox();
                  }
                },
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    AppRouter.router.goNamed(PAGES.story.screenName);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
