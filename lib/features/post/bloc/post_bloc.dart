import 'package:bloc_example/features/post/models/post_model.dart';
import 'package:bloc_example/features/post/repository/post_repository.dart';
import 'package:bloc_example/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository;
  static const _pageSize = 10;

  PostBloc(this.postRepository) : super(PostInitialState()) {
    on<FetchPostEvent>(_fetchPostsApi);
    on<SearchPostEvent>(_searchPosts);
  }

  void _fetchPostsApi(FetchPostEvent event, Emitter<PostState> emit) async {
    try {
      if (event.pageKey == 1) {
        emit(state.copyWith(status: PostStatus.loading));
      }

      final posts = await postRepository.fetchUsers(
        page: event.pageKey,
        limit: _pageSize,
      );
      final isLastPage = posts.length < _pageSize; // check if it's last page

      if (event.pageKey == 1) {
        emit(state.copyWith(
          status: PostStatus.success,
          postList: posts,
          hasReachedMax: isLastPage,
          currentPage: event.pageKey,
        ));
      } else {
        emit(state.copyWith(
          status: PostStatus.success,
          postList: [...state.postList, ...posts],
          hasReachedMax: isLastPage,
          currentPage: event.pageKey,
        ));
      }
    } catch (error) {
      emit(state.copyWith(
          errorMessage: error.toString(), status: PostStatus.failure));
    }
  }

  void _searchPosts(SearchPostEvent event, Emitter<PostState> emit) async {
    try {
      if (event.pageKey == 1) {
        emit(state.copyWith(status: PostStatus.loading));
      }

      final posts = await postRepository.fetchUsers(
        page: event.pageKey,
        limit: _pageSize,
        searchQuery: event.query,
      );
      
      final isLastPage = posts.length < _pageSize;

      if (event.pageKey == 1) {
        emit(state.copyWith(
          status: PostStatus.success,
          postList: posts,
          hasReachedMax: isLastPage,
          currentPage: event.pageKey,
        ));
      } else {
        emit(state.copyWith(
          status: PostStatus.success,
          postList: [...state.postList, ...posts],
          hasReachedMax: isLastPage,
          currentPage: event.pageKey,
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
        status: PostStatus.failure,
      ));
    }
  }
}
