part of 'counter_bloc.dart';

@immutable
sealed class CounterState extends Equatable {
  const CounterState({required this.counter});
  final int counter;

  CounterState copyWith({int? counter}) {
    return CounterUpdated(counter: counter ?? this.counter);
  }

  @override
  List<Object> get props => [counter];
}

class CounterInitial extends CounterState {
  const CounterInitial({super.counter = 0});
}

class CounterUpdated extends CounterState {
  const CounterUpdated({required super.counter});
}
