// ignore_for_file: unused_local_variable, must_be_immutable

import 'dart:io';

import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/common/config/flavor_config.dart';
import 'package:dicoding_story_app/common/enumeration/flavor_type.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/story/story_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/upload/upload_story_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/upload/upload_story_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../app/themes/story_app_typography.dart';

part 'local_components/upload_story_buttons.dart';
part 'local_components/upload_story_description.dart';
part 'local_components/upload_story_image.dart';
part 'local_components/upload_story_scaffold.dart';

class UploadStoryPage extends HookWidget {
  UploadStoryPage({super.key});

  final _descriptionController = TextEditingController();
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final imageState = useState<File?>(null);
    var latitude = useState<double>(0.0);
    var longitude = useState<double>(0.0);

    return UploadStoryScaffold(
      title: AppLocalizations.of(context)!.uploadStory,
      onBackPressed: () => router.pop(),
      imageSection: UploadStoryImage(
        imageFile: imageState.value,
      ),
      descriptionField: UploadStoryDescription(controller: _descriptionController),
      textLocationInfo: FlavorConfig.instance.flavor == FlavorType.paid
          ? Text("Lattitude: ${latitude.value}\nLongitude: ${longitude.value}")
          : const SizedBox(),
      buttons: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlavorConfig.instance.flavor == FlavorType.paid
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: PlatformElevatedButton(
                      child: Text("Pick Location"),
                      onPressed: () async {
                        final LatLng? pickedLocation =
                            await router.pushNamed(PAGES.location.screenName);
                        print(pickedLocation);

                        if (pickedLocation != null) {
                          latitude.value = pickedLocation.latitude;
                          longitude.value = pickedLocation.longitude;
                        }
                      },
                    ),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.maxFinite,
              child: PlatformElevatedButton(
                child: Text("Pick Image"),
                onPressed: () => showImageSourceDialog(context, imageState),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.maxFinite,
              child: FilledButton(
                onPressed: () => uploadStory(context, imageState, latitude, longitude),
                child: Text(AppLocalizations.of(context)!.uploadStory),
              ),
            ),
          )
        ],
      ),
      builder: BlocConsumer<UploadStoryCubit, UploadStoryState>(
        builder: (context, state) {
          return state.when(
            init: () => const SizedBox(),
            loading: () => Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            success: (response) => const SizedBox(),
            error: (error, message) => Center(
              child: Text(message),
            ),
          );
        },
        listener: (context, state) {
          state.whenOrNull(
            success: (response) {
              router.pop(context.read<StoryCubit>()..refreshStories());
            },
          );
        },
      ),
    );
  }

  Future<void> showImageSourceDialog(BuildContext context, ValueNotifier<File?> imageState) async {
    await showPlatformDialog(
      context: context,
      builder: (context) {
        return PlatformAlertDialog(
          title: Text(AppLocalizations.of(context)!.chooseImageSource),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildOption(
                    context,
                    Icons.camera_alt,
                    AppLocalizations.of(context)!.camera,
                    () => _getImageFromSource(
                      context,
                      ImageSource.camera,
                      imageState,
                    ),
                  ),
                  const SizedBox(width: 64.0),
                  buildOption(
                    context,
                    Icons.image,
                    AppLocalizations.of(context)!.gallery,
                    () => _getImageFromSource(
                      context,
                      ImageSource.gallery,
                      imageState,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildOption(BuildContext context, IconData icon, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48.0),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }

  void uploadStory(
    BuildContext context,
    ValueNotifier<File?> imageState,
    ValueNotifier<double> latitude,
    ValueNotifier<double> longitude,
  ) async {
    final imageFile = imageState.value;
    final description = _descriptionController.text;

    if (imageFile == null) {
      Fluttertoast.showToast(msg: "Please Select an Image");
      return;
    }

    if (description.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill the description field.");
      return;
    }

    context
        .read<UploadStoryCubit>()
        .postStory(imageFile, description, latitude.value, longitude.value);
  }

  Future<void> _getImageFromSource(
      BuildContext context, ImageSource source, ValueNotifier<File?> imageState) async {
    final pickedFile = await picker.pickImage(source: source, imageQuality: 60);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      imageState.value = imageFile;
    }

    if (context.mounted) {
      context.pop();
    }
  }
}
