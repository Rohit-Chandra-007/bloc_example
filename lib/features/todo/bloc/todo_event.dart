part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodo extends TodoEvent {
  final Todo todo;

  const AddTodo({
    required this.todo,
  });

  @override
  List<Object> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  final int index;

  const DeleteTodo({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}
