import 'package:dicoding_story_app/features/story_app/presentation/cubit/story/story_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'local_components/maps_control.dart';
part 'local_components/maps_scaffold.dart';
part 'local_components/maps_type_dropdown.dart';
part 'local_components/maps_content.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;

  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);

  final Set<Marker> markers = {};

  MapType selectedMapType = MapType.normal;

  List<LatLng> storiesPlace = [];

  @override
  void initState() {
    super.initState();
    final cubit = context.read<StoryCubit>();

    Future.microtask(() async => cubit.fetchStoriesWithLocation());

    cubit.fetchStoriesWithLocation().then((_) {
      final storiesWithLocation =
          cubit.storiesWithLocation.where((story) => story.lat != 0.0 && story.lon != 0.0).toList();

      setState(() {
        storiesPlace.addAll(storiesWithLocation.map((story) => LatLng(story.lat, story.lon)));
      });
    });

    final marker = Marker(
      markerId: const MarkerId("dicoding"),
      position: dicodingOffice,
      onTap: () {
        mapController.animateCamera(
          CameraUpdate.newLatLngZoom(dicodingOffice, 18),
        );
      },
    );
    markers.add(marker);
    addManyMarker();
  }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
      northeast: LatLng(x1!, y1!),
      southwest: LatLng(x0!, y0!),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(storiesPlace);
    return MapsScaffold(
      mapContent: MapsContent(
        selectedMapType: selectedMapType,
        initialTarget: dicodingOffice,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
          addManyMarker();

          final bound = boundsFromLatLngList([...storiesPlace]);
          mapController.animateCamera(
            CameraUpdate.newLatLngBounds(bound, 50),
          );
        },
        markers: markers,
      ),
      zoomControl: MapsControl(
        onZoomIn: () {
          mapController.animateCamera(CameraUpdate.zoomIn());
        },
        onZoomOut: () {
          mapController.animateCamera(CameraUpdate.zoomOut());
        },
      ),
      mapTypeControl: MapsTypeDropdown(
        onMapTypeSelected: (type) {
          setState(() {
            selectedMapType = type;
          });
        },
      ),
    );
  }

  void addManyMarker() {
    for (var places in storiesPlace) {
      markers.add(
        Marker(
          markerId: MarkerId("dicoding $places"),
          position: places,
          onTap: () {
            mapController.animateCamera(
              CameraUpdate.newLatLngZoom(places, 18),
            );
          },
        ),
      );
    }
  }
}
