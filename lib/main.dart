import 'package:bloc_example/features/image_uploader/ui/image_picker_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(Object context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const ImagePickerScreen(),
    );
  }
}
