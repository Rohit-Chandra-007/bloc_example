import 'package:bloc_example/features/image_uploader/bloc/image_picker_event.dart';
import 'package:bloc_example/features/image_uploader/bloc/image_picker_state.dart';
import 'package:bloc_example/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerService imagePickerService = ImagePickerService();
  ImagePickerBloc(this.imagePickerService) : super(InitialCameraState()) {
    on<CameraEvent>((event, emit) async {
      final imageFile = await imagePickerService.pickImageFromCamera();
      emit(UpdatedCameraState(imageFile: imageFile));
    });
    on<GalleryEvent>((event, emit) async {
      final imageFile = await imagePickerService.pickImageFromGallery();
      emit(UpdatedCameraState(imageFile: imageFile));
    });
  }
}
