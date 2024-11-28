import 'package:bloc_example/features/switch_slider/bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchSliderScreen extends StatelessWidget {
  const SwitchSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch & Slider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Switch(
                      value: state.switchValue,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(
                              SwitchChanged(value),
                            );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  height: 300,
                  color: Colors.red.withOpacity(state.sliderValue),
                );
              },
            ),
            SizedBox(height: 16),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Slider(
                  value: state.sliderValue,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(
                          SliderChanged(value),
                        );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
