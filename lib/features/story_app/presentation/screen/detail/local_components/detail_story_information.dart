part of '../detail_story_screen.dart';

class DetailStoryInformation extends StatelessWidget {
  final StoryResponseItem story;
  DetailStoryInformation({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 16.0),
          FutureBuilder<List<Placemark>>(
            future: _getAddressFromCoordinates(story.lat, story.lon),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final placemark = snapshot.data!.first;
                final address =
                    "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}";
                return Text(
                  address,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(
                  "No Location Attached",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                );
              }
              return const CircularProgressIndicator(); // Loading indicator
            },
          ),
        ],
      ),
    );
  }

  Future<List<Placemark>> _getAddressFromCoordinates(double latitude, double longitude) async {
    final placemarks = await placemarkFromCoordinates(latitude, longitude);
    return placemarks;
  }
}
