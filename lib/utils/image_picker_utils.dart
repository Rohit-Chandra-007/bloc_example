// Suggested code may be subject to a license. Learn more: ~LicenseLog:371128219.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1709172758.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3488744312.
import 'dart:io';

import 'package:image_picker/image_picker.dart';

// Suggested code may be subject to a license. Learn more: ~LicenseLog:1191451218.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3195880247.
class ImagePickerService {
  final ImagePicker _picker = ImagePicker();
  
  Future<File?> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<File?> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
