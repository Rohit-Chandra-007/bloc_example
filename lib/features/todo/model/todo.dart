class Todo {
  final String title;
  final String description;

  Todo({
    required this.title,
    required this.description,
  });

  Todo copyWith({
    String? title,
    String? description,
  }) {
    return Todo(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
