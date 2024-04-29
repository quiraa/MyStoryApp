import 'package:dicoding_story_app/app/di/injection_container.dart';
import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/common/config/flavor_config.dart';

import 'package:dicoding_story_app/features/story_app/presentation/cubit/login/login_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => sl()..checkLoginStatus(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          Future.delayed(Duration(seconds: 3), () {
            state.whenOrNull(
              success: () => router.goNamed(PAGES.main.screenName),
              init: () => router.goNamed(PAGES.login.screenName),
            );
          });
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Image.asset(
                      'assets/images/app_icon.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ).animate().fadeIn(duration: 600.ms),
                const SizedBox(height: 24),
                Text(
                  FlavorConfig.instance.values.appTitle,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
