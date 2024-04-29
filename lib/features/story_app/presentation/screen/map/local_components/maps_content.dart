part of '../maps_page.dart';

class MapsContent extends StatelessWidget {
  final MapType selectedMapType;
  final LatLng initialTarget;
  final Set<Marker> markers;

  final void Function(GoogleMapController controller) onMapCreated;

  const MapsContent({
    Key? key,
    required this.selectedMapType,
    required this.initialTarget,
    required this.onMapCreated,
    required this.markers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: initialTarget,
        zoom: 18,
      ),
      markers: markers,
      mapType: selectedMapType,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (mapController) {
        onMapCreated(mapController);
      },
    );
  }
}
