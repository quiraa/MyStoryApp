part of '../pick_location_page.dart';

class PickLocationScaffold extends StatelessWidget {
  final String title;
  final void Function() onBackPressed;
  final Widget locationContent;
  final Widget myLocationButton;
  final Widget placemarkWidget;

  const PickLocationScaffold({
    Key? key,
    required this.locationContent,
    required this.onBackPressed,
    required this.title,
    required this.myLocationButton,
    required this.placemarkWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(title),
        leading: PlatformIconButton(
          icon: Icon(Icons.adaptive.arrow_back_rounded),
          onPressed: () => onBackPressed(),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            locationContent,
            Positioned(
              top: 16,
              right: 16,
              child: myLocationButton,
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: placemarkWidget,
            ),
          ],
        ),
      ),
    );
  }
}
