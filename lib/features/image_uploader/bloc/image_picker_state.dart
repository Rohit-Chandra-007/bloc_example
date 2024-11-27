import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
sealed class ImagePickerState extends Equatable {
  final File? imageFile;
  const ImagePickerState({this.imageFile});

  @override
  List<Object?> get props => [imageFile];
}

class InitialCameraState extends ImagePickerState {
  const InitialCameraState({super.imageFile});
}

class UpdatedCameraState extends ImagePickerState {
  const UpdatedCameraState({super.imageFile});

  UpdatedCameraState copyWith({File? imageFile}) {
    return UpdatedCameraState(imageFile: imageFile ?? super.imageFile);
  }
}
