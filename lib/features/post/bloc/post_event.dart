part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class FetchPostEvent extends PostEvent {
  final int pageKey;
  const FetchPostEvent({required this.pageKey});
  @override
  List<Object> get props => [pageKey];
}
