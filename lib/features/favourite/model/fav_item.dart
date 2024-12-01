import 'package:equatable/equatable.dart';

class FavouriteItem extends Equatable {
  final String id;
  final String name;
  final String description;
  final bool isFavourite;
  final bool isDeleted;
  final bool isSelected;

  const FavouriteItem({
    required this.id,
    required this.name,
    required this.description,
    this.isFavourite = false,
    this.isDeleted = false,
    this.isSelected = false,
  });

  FavouriteItem copyWith({
    String? id,
    String? name,
    String? description,
    bool? isFavourite,
    bool? isDeleted,
    bool? isSelected,
  }) {
    return FavouriteItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isFavourite: isFavourite ?? this.isFavourite,
      isDeleted: isDeleted ?? this.isDeleted,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, description, isFavourite, isDeleted, isSelected];
}
