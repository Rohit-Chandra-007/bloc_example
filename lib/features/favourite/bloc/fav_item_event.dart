part of 'fav_item_bloc.dart';

sealed class FavItemEvent extends Equatable {
  const FavItemEvent();

  @override
  List<Object> get props => [];
}

final class FetchFavItem extends FavItemEvent {}

final class AddFavItem extends FavItemEvent {
  final FavouriteItem favouriteItem;

  const AddFavItem({required this.favouriteItem});

  @override
  List<Object> get props => [favouriteItem];
}

class ToggleSelectionMode extends FavItemEvent {}

class ToggleItemSelection extends FavItemEvent {
  final String itemId;

  const ToggleItemSelection({required this.itemId});

  @override
  List<Object> get props => [itemId];
}
