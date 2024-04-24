import 'dart:io';

import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/upload/upload_bloc.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/upload/upload_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/upload/upload_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../app/themes/story_app_typography.dart';

// ignore: must_be_immutable
class UploadPage extends HookWidget {
  UploadPage({super.key});

  final _descriptionController = TextEditingController();
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final imageState = useState<File?>(null);
    final switchState = useState<bool>(false);

    return Scaffold(
      appBar: _buildAppBar(context),
      floatingActionButton: _fabPickImage(context, imageState),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImage(imageState.value),
            _buildDescriptionField(context),
            _buildLocationToggle(switchState, context),
            _buildSaveButton(context, imageState),
            const SizedBox(height: 32),
            BlocConsumer<UploadBloc, UploadState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case UploadIdleState:
                    return const SizedBox();

                  case UploadLoadingState:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  case UploadErrorState:
                    return Center(
                      child: Text(state.uploadResponse?.message ?? "Error Occurred"),
                    );

                  case UploadSuccessState:
                    return const SizedBox();

                  default:
                    return const SizedBox();
                }
              },
              listener: (context, state) {
                if (state is UploadSuccessState) {
                  AppRouter.router.pop();
                  Fluttertoast.showToast(msg: "Story Uploaded");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.uploadStory),
      leading: IconButton(
        onPressed: () {
          AppRouter.router.pop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _buildImage(File? imageFile) {
    return Container(
      width: double.maxFinite,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: imageFile != null
          ? Image.file(imageFile, fit: BoxFit.cover)
          : Icon(
              Icons.image_not_supported,
              size: 64.0,
              color: Colors.grey[600],
            ),
    );
  }

  Widget _buildDescriptionField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _descriptionController,
        minLines: 5,
        maxLines: null,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: AppLocalizations.of(context)!.descriptionHint,
          label: Text(AppLocalizations.of(context)!.description),
          alignLabelWithHint: true,
        ),
        keyboardType: TextInputType.multiline,
      ),
    );
  }

  Widget _buildLocationToggle(ValueNotifier<bool> switchState, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              AppLocalizations.of(context)!.enableLocationSharing,
              style: StoryAppTypography.settingMenuTitle,
            ),
          ),
          Switch(
            value: switchState.value,
            onChanged: (newValue) {
              switchState.value = newValue;
            },
          )
        ],
      ),
    );
  }

  Widget _buildSaveButton(
    BuildContext context,
    ValueNotifier<File?> imageState,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.maxFinite,
        child: FilledButton(
          onPressed: () {
            _uploadStory(context, imageState);
          },
          child: Text(
            AppLocalizations.of(context)!.uploadStory,
            style: StoryAppTypography.settingMenuTitle,
          ),
        ),
      ),
    );
  }

  Widget _fabPickImage(BuildContext context, ValueNotifier<File?> imageState) {
    return FloatingActionButton(
      onPressed: () => _showImageSourceDialog(context, imageState),
      child: const Icon(Icons.image_search_rounded),
    );
  }

  Future<void> _showImageSourceDialog(BuildContext context, ValueNotifier<File?> imageState) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
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
                  _buildOption(
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
                  _buildOption(
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

  Widget _buildOption(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
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

  void _uploadStory(
    BuildContext context,
    ValueNotifier<File?> imageState,
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

    context.read<UploadBloc>().add(UploadStoryEvent(description, imageFile, null, null));
  }

  Future<void> _getImageFromSource(
    BuildContext context,
    ImageSource source,
    ValueNotifier<File?> imageState,
  ) async {
    final pickedFile = await picker.pickImage(source: source, imageQuality: 50);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      imageState.value = imageFile;
    }

    context.pop();
  }
}
