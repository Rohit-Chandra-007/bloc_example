import 'package:bloc_example/features/favourite/model/fav_item.dart';

class FavouriteRepository {
  Future<List<FavouriteItem>> fetchFavouriteItem() async {
    return Future.delayed(
      const Duration(seconds: 3),
      () => List.generate(
        10,
        (index) => FavouriteItem(
          id: index.toString(),
          name: 'Favourite Item ${index + 1}',
          description: 'Description for Favourite Item $index',
          isDeleted: false,
        ),
      ),
    );
  }
}
