import 'package:bloc_example/features/post/models/post_model.dart';
import 'package:bloc_example/features/post/repository/post_repository.dart';
import 'package:bloc_example/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitialState()) {
    on<FetchPostEvent>(_fetchPostsApi);
  }

  void _fetchPostsApi(FetchPostEvent event, Emitter<PostState> emit) async {
    try {
      emit(state.copyWith(status: PostStatus.loading)); // Show loading state
      final posts = await postRepository.fetchUsers();
      emit(state.copyWith(postList: posts, status: PostStatus.success));
    } catch (error) {
      emit(state.copyWith(
          errorMessage: error.toString(), status: PostStatus.failure));
    }
  }
}
