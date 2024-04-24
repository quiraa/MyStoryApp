import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/story/story_bloc.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/story/story_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/story/story_state.dart';
import 'package:dicoding_story_app/features/story_app/presentation/widgets/story_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dicoding Story"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                context.pushNamed(PAGES.setting.screenName);
              },
              icon: const Icon(Icons.settings),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(PAGES.upload.screenName).then(
                (value) => context.read<StoryBloc>().add(const RefreshStoriesEvent()),
              );
        },
        tooltip: AppLocalizations.of(context)!.uploadStory,
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<StoryBloc, StoryState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case StoryLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case StoryErrorState:
              return Center(
                child: Text(state.error?.message ?? "Error Occurred"),
              );

            case StorySuccessState:
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  context.read<StoryBloc>().add(const RefreshStoriesEvent());
                  await context.read<StoryBloc>().stream.first;
                },
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  padding: const EdgeInsets.all(16),
                  itemCount: state.data?.listStory.length ?? 0,
                  itemBuilder: (context, index) {
                    final story = state.data?.listStory[index];
                    return StoryCard(
                      story: story!,
                      onStoryClick: () {
                        AppRouter.router.pushNamed(PAGES.detail.screenName, extra: story.id);
                      },
                    );
                  },
                ),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
