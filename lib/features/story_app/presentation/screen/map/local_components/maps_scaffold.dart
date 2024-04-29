part of '../maps_page.dart';

class MapsScaffold extends StatelessWidget {
  final Widget mapContent;
  final Widget zoomControl;
  final Widget mapTypeControl;

  const MapsScaffold({
    Key? key,
    required this.mapContent,
    required this.zoomControl,
    required this.mapTypeControl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(
        child: Stack(
          children: [
            mapContent,
            Positioned(
              bottom: 16,
              right: 16,
              child: zoomControl,
            ),
            Positioned(
              top: 16,
              right: 16,
              child: mapTypeControl,
            )
          ],
        ),
      ),
    );
  }
}
