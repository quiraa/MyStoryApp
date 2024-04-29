part of '../pick_location_page.dart';

class PickLocationWidget extends StatelessWidget {
  final Widget locationInformationWidget;
  final Widget locationButtonWidget;

  const PickLocationWidget({
    Key? key,
    required this.locationInformationWidget,
    required this.locationButtonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        locationInformationWidget,
        const SizedBox(height: 16),
        locationButtonWidget,
      ],
    );
  }
}
