part of '../login_screen.dart';

class LoginScaffold extends HookWidget {
  final Widget loginCard;
  final Widget loginBloc;
  const LoginScaffold({Key? key, required this.loginCard, required this.loginBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              loginCard,
              const SizedBox(height: 32),
              loginBloc,
            ],
          ),
        ),
      ),
    );
  }
}
