part of '../maps_page.dart';

class MapsTypeDropdown extends StatelessWidget {
  final void Function(MapType type) onMapTypeSelected;

  const MapsTypeDropdown({
    Key? key,
    required this.onMapTypeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: () {
        null;
      },
      child: PopupMenuButton<MapType>(
        offset: const Offset(0, 54),
        icon: const Icon(Icons.layers),
        itemBuilder: (context) {
          return [
            const PopupMenuItem<MapType>(
              value: MapType.normal,
              child: Text('Normal'),
            ),
            const PopupMenuItem<MapType>(
              value: MapType.satellite,
              child: Text('Satellite'),
            ),
            const PopupMenuItem<MapType>(
              value: MapType.terrain,
              child: Text('Terrain'),
            ),
            const PopupMenuItem<MapType>(
              value: MapType.hybrid,
              child: Text('Hybrid'),
            ),
          ];
        },
        onSelected: (MapType type) {
          onMapTypeSelected(type);
        },
      ),
    );
  }
}
