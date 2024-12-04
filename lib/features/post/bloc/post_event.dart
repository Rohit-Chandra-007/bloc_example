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

class SearchPostEvent extends PostEvent {
  final String query;
  final int pageKey;
  const SearchPostEvent({required this.query, required this.pageKey});
  
  @override
  List<Object> get props => [query, pageKey];
}
