import 'package:flutter/material.dart';
import 'package:weather_app_bloc/cubit/weather/weather_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final weatherCubit = context.read<WeatherCubit>();
    // final weatherCubit = BlocProvider.of<WeatherCubit>(context);
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (state as WeatherInitial).temperature,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    state.isCelcius ? "°C" : "°F",
                    style: const TextStyle(fontSize: 24),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<WeatherCubit>().updateTemperature("7");
                    },
                    child: const Text("Change"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<WeatherCubit>().toggleTemperatureUnit2();
                    },
                    child: const Text("Change unit"),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
          child: const Icon(Icons.settings),
        ),
      ),
    );
  }
}
