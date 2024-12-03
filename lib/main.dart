import 'package:bloc_example/features/counter/bloc/counter_bloc.dart';
import 'package:bloc_example/features/favourite/bloc/fav_item_bloc.dart';
import 'package:bloc_example/features/favourite/repository/favourite_repository.dart';
import 'package:bloc_example/features/image_uploader/bloc/image_picker_bloc.dart';
import 'package:bloc_example/features/post/bloc/post_bloc.dart';
import 'package:bloc_example/features/post/repository/post_repository.dart';
import 'package:bloc_example/features/post/ui/post_screen.dart';
import 'package:bloc_example/features/switch_slider/bloc/switch_bloc.dart';
import 'package:bloc_example/features/todo/bloc/todo_bloc.dart';
import 'package:bloc_example/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImagePickerBloc(
            ImagePickerService(),
          ),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
        BlocProvider(
          create: (context) => FavItemBloc(FavouriteRepository()),
        ),
        BlocProvider(
          create: (context) => PostBloc(PostRepository()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: PostScreen(),
    );
  }
}
