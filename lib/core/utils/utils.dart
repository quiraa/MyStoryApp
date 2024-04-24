import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';

class Utils {
  static String formatDate(String rawDate) {
    DateTime dateTime = DateTime.parse(rawDate);
    final DateFormat formatter = DateFormat('d MMMM yyyy');
    return formatter.format(dateTime);
  }

  static Future<File> compressImage(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();

    img.Image? image = img.decodeImage(Uint8List.fromList(imageBytes));

    if (image != null && image.lengthInBytes > 1024 * 1024) {
      double scale = 1.0;
      List<int> compressedBytes = [];
      int imageSize = image.lengthInBytes;

      while (imageSize > 1000000) {
        scale *= 0.5; // You can adjust this scaling factor as needed
        img.Image compressedImage = img.copyResize(
          image,
          width: (image.width * scale).round(),
          height: (image.height * scale).round(),
        );

        compressedBytes = img.encodeJpg(compressedImage, quality: 90);

        imageSize = compressedBytes.length;
      }

      String tempPath = imageFile.path.replaceAll(imageFile.path.split('/').last, '');
      String compressedImagePath =
          '$tempPath/${DateTime.now().millisecondsSinceEpoch}_compressed.jpg';

      File compressedImageFile = File(compressedImagePath);
      await compressedImageFile.writeAsBytes(compressedBytes);

      return compressedImageFile;
    }

    return imageFile;
  }

  // File compressImage(File file) {
  //   img.Image? image = img.decodeImage(file.readAsBytesSync());

  //   int width;
  //   int height;

  //   if(image!.width > image.height) {
  //     width = 800;
  //     height = (image.height / image.width * 800).round();
  //   } else {
  //     height = 800;
  //     width = (image.width / image.height * 800).round();
  //   }

  //   img.Image resizedImage = img.copyResize(image, width: width, height: height);

  //   // Compress the image with JPEG format
  //   List<int> compressedBytes =
  //       img.encodeJpg(resizedImage, quality: 85); // Adjust quality as needed

  //   // Save the compressed image to a file
  //   File compressedFile = File(file.path.replaceFirst('.jpg', '_compressed.jpg'));
  //   compressedFile.writeAsBytesSync(compressedBytes);

  //   return compressedFile;
  // }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    if (value.length < 4) {
      return 'Username must be at least 4 characters long';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }

    String pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void togglePasswordVisibility(ValueNotifier<bool> passwordVisible) {
    passwordVisible.value = !passwordVisible.value;
  }
}
