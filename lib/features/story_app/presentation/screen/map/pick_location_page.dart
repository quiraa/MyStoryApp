import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:dicoding_story_app/app/routes/app_router.dart';

part 'local_widget/pick_location_button.dart';
part 'local_widget/pick_location_content.dart';
part 'local_widget/pick_location_information.dart';
part 'local_widget/pick_location_scaffold.dart';
part 'local_widget/pick_my_location_button.dart';
part 'local_widget/pick_location_widget.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({Key? key}) : super(key: key);

  @override
  _PickLocationScreenState createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);
  late GoogleMapController mapController;
  late final Set<Marker> markers = {};

  double latitude = 0.0;
  double longitude = 0.0;

  geo.Placemark? placemark;

  @override
  Widget build(BuildContext context) {
    return PickLocationScaffold(
      locationContent: PickLocationContent(
        markers: markers,
        initialTarget: dicodingOffice,
        onMapCreated: (controller) async {
          final info =
              await geo.placemarkFromCoordinates(dicodingOffice.latitude, dicodingOffice.longitude);
          final place = info[0];
          final street = place.street!;
          final address =
              '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
          setState(() {
            placemark = place;
          });

          defineMarker(dicodingOffice, street, address);

          setState(() {
            mapController = controller;
          });
        },
        onLongPress: (latLng) async {
          onLongPressGoogleMap(latLng);
        },
      ),
      onBackPressed: () => router.pop(),
      title: "Pick Location",
      myLocationButton: PickMyLocationButton(
        onMyLocationPressed: () => onMyLocationButtonPress(),
      ),
      placemarkWidget: placemark == null
          ? const SizedBox()
          : PickLocationWidget(
              locationButtonWidget: PickLocationButton(onSetLocation: () {
                if (placemark != null && latitude != 0.0 && longitude != 0.0) {
                  router.pop<LatLng>(LatLng(latitude, longitude));
                }
              }),
              locationInformationWidget:
                  PickLocationInformation(parentContext: context, placemark: placemark!),
            ),
    );
  }

  void onLongPressGoogleMap(LatLng latLng) async {
    final info = await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    final place = info[0];
    final street = place.street!;

    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      placemark = place;
    });

    defineMarker(latLng, street, address);
    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      infoWindow: InfoWindow(
        title: street,
        snippet: address,
      ),
    );

    setState(() {
      latitude = latLng.latitude;
      longitude = latLng.longitude;
      markers.clear();
      markers.add(marker);
    });
  }

  void onMyLocationButtonPress() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print("Location services is not available");
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Location permission is denied");
        return;
      }
    }

    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);

    final info = await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = info[0];
    final street = place.street;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      placemark = place;
    });

    defineMarker(latLng, street!, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }
}
