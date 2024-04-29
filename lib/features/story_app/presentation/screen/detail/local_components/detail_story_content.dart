part of '../detail_story_screen.dart';

class DetailStoryContent extends StatelessWidget {
  final StoryResponseItem story;
  final Widget detailImage;
  final Widget detailInformation;

  const DetailStoryContent({
    Key? key,
    required this.story,
    required this.detailImage,
    required this.detailInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          detailImage,
          detailInformation,
        ],
      ),
    );
  }
}
