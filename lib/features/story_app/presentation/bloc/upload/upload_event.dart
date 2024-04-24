import 'dart:ffi';
import 'dart:io';

abstract class UploadEvent {
  final String? description;
  final File? imageFile;
  final Float? latitude;
  final Float? longitude;

  const UploadEvent(
      {this.description, this.imageFile, this.latitude, this.longitude});
}

class UploadStoryEvent extends UploadEvent {
  const UploadStoryEvent(
    String description,
    File imageFile,
    Float? latitude,
    Float? longitude,
  ) : super(
          description: description,
          imageFile: imageFile,
          latitude: latitude,
          longitude: longitude,
        );
}