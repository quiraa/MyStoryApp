part of '../upload_page.dart';

class UploadStoryDescription extends StatelessWidget {
  final TextEditingController controller;
  const UploadStoryDescription({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PlatformTextField(
        controller: controller,
        minLines: 5,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        material: (context, platform) {
          return MaterialTextFieldData(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: AppLocalizations.of(context)!.descriptionHint,
              label: Text(AppLocalizations.of(context)!.description),
              alignLabelWithHint: true,
            ),
          );
        },
        cupertino: (context, platform) {
          return CupertinoTextFieldData(
            placeholder: AppLocalizations.of(context)!.descriptionHint,
          );
        },
      ),
    );
  }
}
