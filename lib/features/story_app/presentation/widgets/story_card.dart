// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story_response_item.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StoryCard extends StatelessWidget {
  final StoryResponseItem story;
  final void Function() onStoryClick;

  const StoryCard({
    super.key,
    required this.story,
    required this.onStoryClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          onStoryClick();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
              imageUrl: story.photoUrl,
              errorWidget: (context, url, error) {
                return const Center(
                  child: Icon(Icons.image_not_supported_outlined),
                );
              },
              progressIndicatorBuilder: (context, url, progress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    story.name,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    story.description,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
