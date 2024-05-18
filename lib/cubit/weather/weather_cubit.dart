import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial(isCelcius: true, temperature: "0"));

  void updateTemperature(String temperature) {
    final currentState = state;
    if (currentState is WeatherInitial) {
      emit(WeatherInitial(
        isCelcius: currentState.isCelcius,
        temperature: temperature,
      ));
    }
  }

  void toggleTemperatureUnit({required bool isCelcius}) {
    final currentState = state;
    if (currentState is WeatherInitial) {
      emit(WeatherInitial(
        isCelcius: isCelcius,
        temperature: currentState.temperature,
      ));
    }
  }
}
