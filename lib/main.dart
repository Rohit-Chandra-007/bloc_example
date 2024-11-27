import 'package:bloc_example/features/counter/bloc/counter_bloc.dart';
import 'package:bloc_example/features/counter/ui/counter_screen.dart';
import 'package:bloc_example/features/image_uploader/bloc/image_picker_bloc.dart';
import 'package:bloc_example/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker',
      theme: ThemeData.dark(),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerService()),
        ),
        BlocProvider(create: (context) => CounterBloc()),
      ], child: CounterScreen()),
    );
  }
}
