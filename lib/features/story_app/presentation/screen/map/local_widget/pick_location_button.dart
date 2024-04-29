part of '../pick_location_page.dart';

class PickLocationButton extends StatelessWidget {
  final void Function() onSetLocation;

  const PickLocationButton({Key? key, required this.onSetLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: FilledButton(
        child: Text(
          "Set Location",
        ),
        onPressed: () => onSetLocation(),
      ),
    );
  }
}
