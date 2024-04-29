// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../upload_page.dart';

class UploadStoryImage extends StatelessWidget {
  final File? imageFile;
  const UploadStoryImage({
    Key? key,
    this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: imageFile != null
          ? Image.file(imageFile!, fit: BoxFit.cover)
          : Icon(
              Icons.image_not_supported,
              size: 64.0,
              color: Colors.grey[600],
            ),
    );
  }
}
