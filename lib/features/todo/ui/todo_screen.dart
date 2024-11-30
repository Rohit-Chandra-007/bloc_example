import 'package:bloc_example/features/todo/bloc/todo_bloc.dart';
import 'package:bloc_example/features/todo/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(state.todos[index].title),
                    subtitle: Text(state.todos[index].description),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Delete todo
                        context.read<TodoBloc>().add(
                              DeleteTodo(
                                index: index,
                              ),
                            );
                      },
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Add todo
          String title = '';
          String description = '';
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        // Add new todo logic
                        title = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'New Todo',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {
                        // Add new todo logic
                        description = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Add new todo logic
                        context.read<TodoBloc>().add(
                              AddTodo(
                                todo: Todo(
                                  title: title,
                                  description: description,
                                ),
                              ),
                            );

                        Navigator.pop(context);
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
