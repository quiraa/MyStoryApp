part of '../register_screen.dart';

class RegisterScaffold extends StatelessWidget {
  final Widget registerCard;
  final Widget registerBloc;

  const RegisterScaffold({
    Key? key,
    required this.registerCard,
    required this.registerBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              registerCard,
              const SizedBox(height: 32),
              registerBloc,
            ],
          ),
        ),
      ),
    );
  }
}
