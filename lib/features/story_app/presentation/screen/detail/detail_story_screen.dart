import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/detail/detail_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/detail/detail_state.dart';
import 'package:flutter/material.dart';

import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/core/utils/utils.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/story_response_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geocoding/geocoding.dart';

part 'local_components/detail_story_content.dart';
part 'local_components/detail_story_image.dart';
part 'local_components/detail_story_scaffold.dart';
part 'local_components/detail_story_information.dart';
part 'local_components/detail_error_content.dart';

class DetailPage extends StatelessWidget {
  final String storyId;
  const DetailPage({super.key, required this.storyId});

  @override
  Widget build(BuildContext context) {
    return DetailStoryScaffold(
      title: AppLocalizations.of(context)!.detailStory,
      onBackPressed: () => router.pop(),
      builder: BlocBuilder<DetailStoryCubit, DetailStoryState>(
        builder: (context, state) {
          return state.when(
            init: () => const SizedBox(),
            loading: () => Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            success: (responseData) {
              return DetailStoryContent(
                story: responseData,
                detailImage: DetailStoryImage(story: responseData),
                detailInformation: DetailStoryInformation(story: responseData),
              );
            },
            error: (error, message) => DetailErrorContent(
              onRetryCallback: () => context.read<DetailStoryCubit>().fetchDetailStory(storyId),
              message: message,
            ),
          );
        },
      ),
    );
  }
}
