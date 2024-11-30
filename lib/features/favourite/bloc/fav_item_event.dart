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
