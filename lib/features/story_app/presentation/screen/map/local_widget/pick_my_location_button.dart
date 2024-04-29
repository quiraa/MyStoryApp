part of '../pick_location_page.dart';

class PickMyLocationButton extends StatelessWidget {
  final void Function() onMyLocationPressed;

  const PickMyLocationButton({Key? key, required this.onMyLocationPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      child: const Icon(Icons.my_location_rounded),
      onPressed: () => onMyLocationPressed(),
    );
  }
}
