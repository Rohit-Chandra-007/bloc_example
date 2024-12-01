part of 'fav_item_bloc.dart';

enum ListStatus { failure, loading, success }

sealed class FavItemState extends Equatable {
  const FavItemState(
      {required this.favouriteItems,
      required this.status,
      required this.isSelectionMode});

  final List<FavouriteItem> favouriteItems;
  final ListStatus status;
  final bool isSelectionMode;

  FavItemState copyWith({
    List<FavouriteItem>? favouriteItems,
    ListStatus? status,
    bool? isSelectionMode,
  }) {
    return FavItemUpdated(
      favouriteItems: favouriteItems ?? this.favouriteItems,
      status: status ?? this.status,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
    );
  }

  @override
  List<Object> get props => [favouriteItems, status, isSelectionMode];
}

final class FavItemInitial extends FavItemState {
  const FavItemInitial(
      {super.favouriteItems = const [],
      super.status = ListStatus.loading,
      super.isSelectionMode = false});
}

final class FavItemUpdated extends FavItemState {
  const FavItemUpdated(
      {required super.favouriteItems,
      required super.status,
      required super.isSelectionMode});
}
