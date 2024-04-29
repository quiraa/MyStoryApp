// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../upload_page.dart';

class UploadStoryButtons extends StatelessWidget {
  final void Function() onUploadStory;
  final void Function() onPickLocation;
  final void Function() onShowImagePickerDialog;

  const UploadStoryButtons({
    Key? key,
    required this.onUploadStory,
    required this.onShowImagePickerDialog,
    required this.onPickLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: PlatformElevatedButton(
                    onPressed: () => onPickLocation(),
                    child: Text(
                      "Pick Location",
                      style: StoryAppTypography.settingMenuTitle,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: PlatformElevatedButton(
                    onPressed: () => onShowImagePickerDialog(),
                    child: Text(
                      AppLocalizations.of(context)!.pickImage,
                      style: StoryAppTypography.settingMenuTitle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.maxFinite,
            child: FilledButton(
              onPressed: () => onUploadStory(),
              child: Text(
                AppLocalizations.of(context)!.uploadStory,
                style: StoryAppTypography.settingMenuTitle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
