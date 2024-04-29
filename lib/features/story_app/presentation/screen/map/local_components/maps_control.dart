part of '../maps_page.dart';

class MapsControl extends StatelessWidget {
  final void Function() onZoomIn;
  final void Function() onZoomOut;

  const MapsControl({
    Key? key,
    required this.onZoomIn,
    required this.onZoomOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          heroTag: "zoom-in",
          onPressed: () {
            onZoomIn();
          },
          child: const Icon(Icons.add),
        ),
        FloatingActionButton.small(
          heroTag: "zoom-out",
          onPressed: () {
            onZoomOut();
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
