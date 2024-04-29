// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../upload_page.dart';

class UploadStoryScaffold extends StatelessWidget {
  final String title;
  final void Function() onBackPressed;
  final Widget imageSection;
  final Widget textLocationInfo;
  final Widget descriptionField;

  final Widget buttons;
  final Widget builder;

  const UploadStoryScaffold({
    Key? key,
    required this.title,
    required this.onBackPressed,
    required this.imageSection,
    required this.descriptionField,
    required this.buttons,
    required this.builder,
    required this.textLocationInfo,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageSection,
            descriptionField,
            const SizedBox(height: 16),
            textLocationInfo,
            const SizedBox(height: 16),
            buttons,
            const SizedBox(height: 32),
            builder,
          ],
        ),
      ),
    );
  }
}
