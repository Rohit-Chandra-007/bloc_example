import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial()) {
    on<SwitchEvent>(_switchToggle);
  }

  void _switchToggle(SwitchEvent event, Emitter<SwitchState> emit) {
    if (event is SwitchChanged) {
      emit(state.copyWith(switchValue: event.value));
    } else if (event is SliderChanged) {
      emit(state.copyWith(sliderValue: event.value));
    }
  }
}
