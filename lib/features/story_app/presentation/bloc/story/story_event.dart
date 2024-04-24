abstract class StoryEvent {
  final String? storyId;

  const StoryEvent({this.storyId});
}

class GetAllStoriesEvent extends StoryEvent {
  const GetAllStoriesEvent();
}

class RefreshStoriesEvent extends StoryEvent {
  const RefreshStoriesEvent();
}
