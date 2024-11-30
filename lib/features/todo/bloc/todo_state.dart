part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState({required this.todos});

  final List<Todo> todos;

  TodoState copyWith({List<Todo>? todos}) {
    return TodoUpdated(todos: todos ?? this.todos);
  }

  @override
  List<Object> get props => [todos];
}

final class TodoInitial extends TodoState {
  const TodoInitial({super.todos = const []});
}

final class TodoUpdated extends TodoState {
  const TodoUpdated({required super.todos});
}
