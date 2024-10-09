import 'package:flutter/material.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            size: 48,
            Icons.camera,
          ),
        ),
      ),
    );
  }
}
