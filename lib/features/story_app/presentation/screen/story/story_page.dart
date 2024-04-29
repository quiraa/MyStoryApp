import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/app/themes/story_app_typography.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/story/story_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/story/story_state.dart';
import 'package:dicoding_story_app/features/story_app/presentation/widgets/story_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<StoryCubit>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        cubit.fetchAllStories();
      }
    });

    Future.microtask(() async => cubit.fetchAllStories());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: AppLocalizations.of(context)!.uploadStory,
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () => router.pushNamed(PAGES.upload.screenName),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<StoryCubit, StoryState>(
        builder: (context, state) {
          final cubit = context.read<StoryCubit>();

          return state.when(
            init: () => const SizedBox(
              child: Text("Init"),
            ),
            loading: () => Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            success: (stories) {
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  await Future.microtask(() => context.read<StoryCubit>().refreshStories());
                },
                child: ListView.separated(
                  controller: _scrollController,
                  itemCount: cubit.allStories.length,
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (context, _) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    if (index == stories.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }

                    return StoryCard(
                      story: stories[index],
                      onStoryClick: () {
                        router.pushNamed(PAGES.detail.screenName, extra: stories[index].id);
                      },
                    );
                  },
                ),
              );
            },
            error: (error, message) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    style: StoryAppTypography.settingMenuTitle,
                  ),
                  PlatformTextButton(
                    child: Text("Try Again"),
                    onPressed: () {
                      context.read<StoryCubit>().refreshStories();
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
