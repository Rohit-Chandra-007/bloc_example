part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerState extends Equatable {
  final File? imageFile;
  const ImagePickerState({this.imageFile});

  ImagePickerState copyWith({File? imageFile}) {
    return UpdatedCameraState(imageFile: imageFile ?? this.imageFile);
  }

  @override
  List<Object?> get props => [imageFile];
}

class InitialCameraState extends ImagePickerState {
  const InitialCameraState({super.imageFile});
}

class UpdatedCameraState extends ImagePickerState {
  const UpdatedCameraState({super.imageFile});

}
