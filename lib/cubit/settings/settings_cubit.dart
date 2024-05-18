import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial(isCelcius: true));

  void toggleTemperatureUnit() {
    final currentState = state;
    if (currentState is SettingsInitial) {
      emit(SettingsInitial(isCelcius: !currentState.isCelcius));
    }
  }

  SettingsState copyWith({bool? isCelcius}) {
    return SettingsInitial(
        isCelcius: isCelcius ?? (state as SettingsInitial).isCelcius);
  }
}
