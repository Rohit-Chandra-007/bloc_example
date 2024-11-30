
import 'package:bloc_example/features/todo/model/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    // new list is created with the previous todos and the new todo
    final updatedTodos = [...state.todos, event.todo];
    emit(TodoUpdated(todos: updatedTodos));
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    final updatedTodos = List<Todo>.from(state.todos)..removeAt(event.index);
    emit(TodoUpdated(todos: updatedTodos));
  }
}
