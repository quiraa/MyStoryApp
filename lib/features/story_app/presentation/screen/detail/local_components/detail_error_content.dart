part of '../detail_story_screen.dart';

class DetailErrorContent extends StatelessWidget {
  final void Function() onRetryCallback;
  final String message;

  const DetailErrorContent({
    Key? key,
    required this.onRetryCallback,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(message),
          const SizedBox(height: 16),
          PlatformTextButton(
            child: Text("Try Again"),
            onPressed: () => onRetryCallback(),
          ),
        ],
      ),
    );
  }
}
