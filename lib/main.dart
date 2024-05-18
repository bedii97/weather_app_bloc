import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubit/settings/settings_cubit.dart';
import 'package:weather_app_bloc/cubit/weather/weather_cubit.dart';
import 'package:weather_app_bloc/presentation/screen/home_page.dart';
import 'package:weather_app_bloc/presentation/screen/home_screen2.dart';
import 'package:weather_app_bloc/presentation/screen/settings_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherCubit(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        routes: {
          '/': (context) => const HomePage2(),
          '/settings': (context) => const SettingsPage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
