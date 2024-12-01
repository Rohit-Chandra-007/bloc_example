import 'package:bloc_example/features/favourite/bloc/fav_item_bloc.dart';
import 'package:bloc_example/features/favourite/model/fav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavItemScreen extends StatefulWidget {
  const FavItemScreen({super.key});

  @override
  State<FavItemScreen> createState() => _FavItemScreenState();
}

class _FavItemScreenState extends State<FavItemScreen> {
  @override
  void initState() {
    context.read<FavItemBloc>().add(FetchFavItem());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Item App'),
      ),
      body: BlocBuilder<FavItemBloc, FavItemState>(
        bloc: BlocProvider.of<FavItemBloc>(context),
        builder: (context, state) {
          if (state.status == ListStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == ListStatus.success) {
            return ListView.builder(
              itemCount: state.favouriteItems.length,
              itemBuilder: (context, index) {
                final favItem = state.favouriteItems[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    leading: state.isSelectionMode
                        ? Checkbox(
                            value: favItem.isSelected,
                            checkColor: Colors.white,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              context.read<FavItemBloc>().add(
                                    ToggleItemSelection(itemId: favItem.id),
                                  );
                            },
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(
                              favItem.name[0],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                    title: Text(
                      favItem.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(favItem.description),
                    trailing: IconButton(
                      icon: favItem.isFavourite
                          ? Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_border),
                      onPressed: () {
                        // Add your onPressed code here!
                        final favouriteItem = FavouriteItem(
                          id: favItem.id,
                          name: favItem.name,
                          description: favItem.description,
                          isFavourite: !favItem.isFavourite,
                          isDeleted: favItem.isDeleted,
                          isSelected: favItem.isSelected,
                        );
                        context
                            .read<FavItemBloc>()
                            .add(AddFavItem(favouriteItem: favouriteItem));
                      },
                    ),
                    onLongPress: () {
                      context.read<FavItemBloc>().add(
                            ToggleSelectionMode(),
                          );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('Something went wrong!'),
            );
          }
        },
      ),
    );
  }
}
