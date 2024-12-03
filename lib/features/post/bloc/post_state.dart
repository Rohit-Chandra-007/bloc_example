part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState({
    required this.status,
    required this.postList,
    required this.errorMessage,
    required this.hasReachedMax,
    required this.currentPage,
  });
  final PostStatus status;
  final List<PostModel> postList;
  final String errorMessage;
  final bool hasReachedMax;
  final int currentPage;

  PostState copyWith(
      {PostStatus? status,
      List<PostModel>? postList,
      String? errorMessage,
      bool? hasReachedMax,
      int? currentPage}) {
    return PostUpdatedState(
        status: status ?? this.status,
        postList: postList ?? this.postList,
        errorMessage: errorMessage ?? this.errorMessage,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        currentPage: currentPage ?? this.currentPage);
  }

  @override
  List<Object> get props =>
      [status, postList, errorMessage, hasReachedMax, currentPage];
}

final class PostInitialState extends PostState {
  const PostInitialState(
      {super.status = PostStatus.loading,
      super.postList = const <PostModel>[],
      super.errorMessage = '',
      super.hasReachedMax = false,
      super.currentPage = 1});
}

final class PostUpdatedState extends PostState {
  const PostUpdatedState(
      {required super.status,
      required super.postList,
      required super.errorMessage,
      required super.hasReachedMax,
      required super.currentPage});
}
