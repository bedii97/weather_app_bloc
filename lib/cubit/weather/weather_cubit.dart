import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_bloc/fakedata.dart';

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

  void toggleTemperatureUnit2() {
    final currentState = state;
    if (currentState is WeatherInitial) {
      emit(WeatherInitial(
        isCelcius: !currentState.isCelcius,
        temperature: currentState.temperature,
      ));
    }
  }

  void fetchTemperature() {
    final currentState = state;
    if (currentState is WeatherInitial) {
      final fakeData = FakeData.getFakeData();
      final temperature = fakeData.keys.first;
      emit(WeatherInitial(
        isCelcius: fakeData[temperature]!,
        temperature: temperature,
      ));
    }
  }

  WeatherState copyWith({
    bool? isCelcius,
    String? temperature,
  }) {
    return WeatherInitial(
      isCelcius: isCelcius ?? (state as WeatherInitial).isCelcius,
      temperature: temperature ?? (state as WeatherInitial).temperature,
    );
  }
}
