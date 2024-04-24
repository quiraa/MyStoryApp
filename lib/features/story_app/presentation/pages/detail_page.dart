import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_story_app/app/di/injection_container.dart';
import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/core/utils/utils.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story_response_item.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/detail/detail_bloc.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/detail/detail_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/detail/detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailStoryBloc>(
      create: (_) => sl()..add(GetDetailStoryEvent(id)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Story"),
          leading: IconButton(
              onPressed: () {
                AppRouter.router.pop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: BlocBuilder<DetailStoryBloc, DetailStoryState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case DetailLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case DetailErrorState:
                return Center(
                  child: Text(state.error?.message ?? ""),
                );

              case DetailSuccessState:
                return _buildContent(context, state.detailStory!.story);

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, StoryResponseItem story) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageBody(context, story),
          _buildDescriptionBody(context, story),
        ],
      ),
    );
  }

  Widget _buildImageBody(BuildContext context, StoryResponseItem story) {
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

  Widget _buildDescriptionBody(BuildContext context, StoryResponseItem story) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            story.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              Utils.formatDate(story.createdAt),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            story.description,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
