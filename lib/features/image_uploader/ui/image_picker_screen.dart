import 'package:bloc_example/features/image_uploader/bloc/image_picker_bloc.dart';
import 'package:bloc_example/features/image_uploader/bloc/image_picker_event.dart';
import 'package:bloc_example/features/image_uploader/bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
          if (state.imageFile == null) {
            return IconButton(
              onPressed: () {
                context.read<ImagePickerBloc>().add(CameraEvent());
              },
              icon: const Icon(
                size: 48,
                Icons.camera,
              ),
            );
          } else {
            return Image.file(state.imageFile!);
          }
        }),
      ),
    );
  }
}
