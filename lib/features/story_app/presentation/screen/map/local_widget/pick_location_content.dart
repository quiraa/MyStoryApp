part of '../pick_location_page.dart';

class PickLocationContent extends StatelessWidget {
  final LatLng initialTarget;
  final Set<Marker> markers;
  final void Function(GoogleMapController controller) onMapCreated;
  final void Function(LatLng latLng) onLongPress;

  const PickLocationContent({
    Key? key,
    required this.initialTarget,
    required this.onMapCreated,
    required this.markers,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      initialCameraPosition: CameraPosition(
        zoom: 20,
        target: initialTarget,
      ),
      onMapCreated: (controller) async {
        onMapCreated(controller);
      },
      onLongPress: (latLng) {
        onLongPress(latLng);
      },
    );
  }
}
