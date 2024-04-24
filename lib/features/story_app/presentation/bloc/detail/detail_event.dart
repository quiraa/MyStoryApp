abstract class DetailStoryEvent {
  final String? storyId;

  const DetailStoryEvent({this.storyId});
}

class GetDetailStoryEvent extends DetailStoryEvent {
  const GetDetailStoryEvent(String storyId) : super(storyId: storyId);
}
