import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/register/register_bloc.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/register/register_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/register/register_state.dart';
import 'package:dicoding_story_app/features/story_app/presentation/widgets/register_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RegisterCard(
                context: context,
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                onNavigateToLogin: () => context.goNamed(PAGES.login.screenName),
                onRegisterUser: () {
                  if (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    final name = nameController.text.toString();
                    final email = emailController.text.toString();
                    final password = passwordController.text.toString();

                    context.read<RegisterBloc>().add(RegisterUserEvent(name, email, password));
                  } else {
                    Fluttertoast.showToast(msg: 'Please fill in the blank fields');
                  }
                },
              ),
              const SizedBox(height: 32),
              BlocConsumer<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case RegisterIdleState:
                      return const SizedBox();

                    case RegisterLoadingState:
                      return const CircularProgressIndicator();

                    case RegisterErrorState:
                      return Text(state.error?.message ?? "Error Occured");

                    case RegisterSuccessState:
                      return const SizedBox();

                    default:
                      return const SizedBox();
                  }
                },
                listener: (context, state) {
                  if (state is RegisterSuccessState) {
                    AppRouter.router.goNamed(PAGES.login.screenName);
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
