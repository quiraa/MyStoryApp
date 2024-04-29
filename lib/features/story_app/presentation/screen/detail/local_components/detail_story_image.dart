part of '../detail_story_screen.dart';

class DetailStoryImage extends StatelessWidget {
  final StoryResponseItem story;
  const DetailStoryImage({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: story.photoUrl,
      errorWidget: (context, url, error) => const Padding(
        padding: EdgeInsets.all(32.0),
        child: Icon(Icons.image_not_supported_rounded),
      ),
      progressIndicatorBuilder: (context, url, progress) {
        return const Center(child: CircularProgressIndicator());
      },
      height: 320,
      width: double.maxFinite,
      fit: BoxFit.cover,
    );
  }
}
