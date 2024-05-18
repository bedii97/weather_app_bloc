part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {
  bool isCelcius;

  SettingsInitial({
    required this.isCelcius,
  });
  //copywith
  SettingsInitial copyWith({
    bool? isCelcius,
  }) {
    return SettingsInitial(
      isCelcius: isCelcius ?? this.isCelcius,
    );
  }
}
