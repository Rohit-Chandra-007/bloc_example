part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState(
      {required this.status,
      required this.postList,
      required this.errorMessage});
  final PostStatus status;
  final List<PostModel> postList;
  final String errorMessage;

  PostState copyWith(
      {PostStatus? status, List<PostModel>? postList, String? errorMessage}) {
    return PostUpdatedState(
        status: status ?? this.status,
        postList: postList ?? this.postList,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object> get props => [status, postList, errorMessage];
}

final class PostInitialState extends PostState {
  const PostInitialState(
      {super.status = PostStatus.loading,
      super.postList = const <PostModel>[],
      super.errorMessage = ''});
}

final class PostUpdatedState extends PostState {
  const PostUpdatedState(
      {required super.status,
      required super.postList,
      required super.errorMessage});
}
