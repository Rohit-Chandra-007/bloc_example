import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@immutable
sealed class ImagePickerState extends Equatable {
  final XFile? imageFile;
  const ImagePickerState({this.imageFile});

  @override
  List<Object?> get props => [imageFile];
}

class InitialCameraState extends ImagePickerState {
  const InitialCameraState({super.imageFile});
}

class UpdatedCameraState extends ImagePickerState {
  const UpdatedCameraState({super.imageFile});

  UpdatedCameraState copyWith({XFile? imageFile}) {
    return UpdatedCameraState(imageFile: imageFile ?? super.imageFile);
  }
}
