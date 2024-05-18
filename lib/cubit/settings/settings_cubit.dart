import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial(isCelcius: true));

  void toggleTemperatureUnit() {
    final currentstate = state;
    if (currentstate is SettingsInitial) {
      emit(copyWith(isCelcius: !currentstate.isCelcius));
    }
  }

  SettingsState copyWith({bool? isCelcius}) {
    return SettingsInitial(
        isCelcius: isCelcius ?? (state as SettingsInitial).isCelcius);
  }
}
