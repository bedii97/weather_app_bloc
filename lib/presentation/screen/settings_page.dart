import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubit/settings/settings_cubit.dart';
import 'package:weather_app_bloc/cubit/weather/weather_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
        return BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // context.read<WeatherCubit>().toggleTemperatureUnit();
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Center(
                child: Column(
                  children: [
                    Text((settingsState as SettingsInitial).isCelcius
                        ? "Celcius"
                        : "Fahrenheit"),
                    ElevatedButton(
                        onPressed: () {
                          context.read<SettingsCubit>().toggleTemperatureUnit();
                        },
                        child: const Text("Change")),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
