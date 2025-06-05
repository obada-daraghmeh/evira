import 'dart:io';

import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

class ImagePickerHelper {
  static Future<File?> get pickImageFromGallery async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) return File(pickedFile.path);
    return null;
  }

  static Future<File?> get pickImageFromCamera async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) return File(pickedFile.path);
    return null;
  }
}
