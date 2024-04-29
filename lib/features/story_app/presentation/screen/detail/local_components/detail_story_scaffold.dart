part of '../detail_story_screen.dart';

class DetailStoryScaffold extends StatelessWidget {
  final String title;
  final void Function() onBackPressed;
  final Widget builder;

  const DetailStoryScaffold({
    Key? key,
    required this.onBackPressed,
    required this.builder,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(title),
        leading: PlatformIconButton(
          icon: Icon(Icons.adaptive.arrow_back_rounded),
          onPressed: () => onBackPressed(),
        ),
      ),
      body: builder,
    );
  }
}
