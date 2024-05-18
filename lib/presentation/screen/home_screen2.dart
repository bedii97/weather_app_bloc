import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubit/settings/settings_cubit.dart';
import 'package:weather_app_bloc/cubit/weather/weather_cubit.dart';
import 'package:weather_app_bloc/presentation/screen/settings_page.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherCubit = context.watch<WeatherCubit>();
    final settingsCubit = context.watch<SettingsCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hava Durumu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sıcaklık: ${(weatherCubit as WeatherInitial).temperature}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Birim: ${(settingsCubit.state as SettingsInitial).isCelcius ? "Celcius" : "Fahrenheit"}',
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
              child: const Text('Ayarlar'),
            ),
          ],
        ),
      ),
    );
  }
}
