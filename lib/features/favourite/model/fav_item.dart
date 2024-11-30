import 'package:equatable/equatable.dart';

class FavouriteItem extends Equatable {
  final String id;
  final String name;
  final String description;
  final bool isFavourite;
  final bool isDeleted;

  const FavouriteItem({
    required this.id,
    required this.name,
    required this.description,
    this.isFavourite = false,
    required this.isDeleted,
  });

  FavouriteItem copyWith({
    String? id,
    String? name,
    String? description,
    bool? isFavourite,
    bool? isDeleted,
  }) {
    return FavouriteItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isFavourite: isFavourite ?? this.isFavourite,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [id, name, description, isFavourite, isDeleted];
}
