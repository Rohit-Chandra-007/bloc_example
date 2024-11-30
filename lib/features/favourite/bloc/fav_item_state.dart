part of 'fav_item_bloc.dart';

enum ListStatus { failure, loading, success }

sealed class FavItemState extends Equatable {
  const FavItemState({required this.favouriteItems, required this.status});

  final List<FavouriteItem> favouriteItems;
  final ListStatus status;

  FavItemState copyWith(
      {List<FavouriteItem>? favouriteItems, ListStatus? status}) {
    return FavItemUpdated(
        favouriteItems: favouriteItems ?? this.favouriteItems,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [favouriteItems, status];
}

final class FavItemInitial extends FavItemState {
  const FavItemInitial(
      {super.favouriteItems = const [], super.status = ListStatus.loading});
}

final class FavItemUpdated extends FavItemState {
  const FavItemUpdated({required super.favouriteItems, required super.status});
}
