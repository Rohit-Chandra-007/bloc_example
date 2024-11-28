part of 'switch_bloc.dart';

sealed class SwitchState extends Equatable {
  const SwitchState({required this.switchValue, required this.sliderValue});
  final bool switchValue;
  final double sliderValue;

  SwitchState copyWith({bool? switchValue, double? sliderValue}) {
    return SwitchToggle(
      switchValue: switchValue ?? this.switchValue,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  List<Object> get props => [
        switchValue,
        sliderValue,
      ];
}

final class SwitchInitial extends SwitchState {
  const SwitchInitial({super.switchValue = false, super.sliderValue = 0.0});
}

final class SwitchToggle extends SwitchState {
  const SwitchToggle({required super.switchValue, required super.sliderValue});
}
