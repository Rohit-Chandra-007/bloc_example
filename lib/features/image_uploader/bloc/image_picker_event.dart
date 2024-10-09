import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();
  @override
  List<Object?> get props => [];
}

class CameraEvent extends ImagePickerEvent {}

class GalleryEvent extends ImagePickerEvent {}
