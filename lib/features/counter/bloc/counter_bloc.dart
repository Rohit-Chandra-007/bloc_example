import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<Increment>(_increment);

    on<Decrement>(_decrement);
  }
  void _increment(Increment event, Emitter<CounterState> emit) =>
      emit(state.copyWith(counter: state.counter + 1));

  void _decrement(Decrement event, Emitter<CounterState> emit) =>
      emit(state.copyWith(counter: state.counter - 1));
}
