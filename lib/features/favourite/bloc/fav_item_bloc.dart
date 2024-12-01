import 'package:bloc_example/features/favourite/model/fav_item.dart';
import 'package:bloc_example/features/favourite/repository/favourite_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fav_item_event.dart';
part 'fav_item_state.dart';

class FavItemBloc extends Bloc<FavItemEvent, FavItemState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItem> favouriteItems = [];
  FavItemBloc(this.favouriteRepository) : super(FavItemInitial()) {
    on<FetchFavItem>(_fetchFavItem);
    on<AddFavItem>(_markFavourite);
    on<ToggleSelectionMode>((event, emit) {
      if (state is FavItemUpdated) {
        emit(state.copyWith(isSelectionMode: !state.isSelectionMode));
      }
    });

    on<ToggleItemSelection>((event, emit) {
      if (state is FavItemUpdated) {
        final updatedItems = state.favouriteItems.map((item) {
          if (item.id == event.itemId) {
            return item.copyWith(isSelected: !item.isSelected);
          }
          return item;
        }).toList();

        emit(state.copyWith(favouriteItems: updatedItems));
      }
    });
  }

  void _fetchFavItem(FetchFavItem event, Emitter<FavItemState> emit) async {
    emit(state.copyWith(status: ListStatus.loading));
    favouriteItems = await favouriteRepository.fetchFavouriteItem();
    if (state is FavItemUpdated) {
      emit(state.copyWith(
          favouriteItems: List.from(favouriteItems),
          status: ListStatus.success));
    }
  }

  void _markFavourite(AddFavItem event, Emitter<FavItemState> emit) {
    final index = favouriteItems
        .indexWhere((element) => element.id == event.favouriteItem.id);
    favouriteItems[index] = event.favouriteItem;
    if (state is FavItemUpdated) {
      emit(state.copyWith(favouriteItems: List.from(favouriteItems)));
    }
  }
}
