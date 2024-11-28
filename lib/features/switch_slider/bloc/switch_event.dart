part of 'switch_bloc.dart';

@immutable
sealed class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class SwitchChanged extends SwitchEvent {
  final bool value;

  const SwitchChanged(this.value);

  @override
  List<Object> get props => [value];
}

class SliderChanged extends SwitchEvent {
  final double value;

  const SliderChanged(this.value);

  @override
  List<Object> get props => [value];
}
