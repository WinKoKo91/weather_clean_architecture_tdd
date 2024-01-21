import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class PoweredByWidget extends StatelessWidget {
  const PoweredByWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Powered By'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Image.asset(
                  'assets/logo/open_weather.png',
                  height: 48,
                  width: 48,
                ),
              ),
              const Text('OpenWeather'),
            ],
          ),
        );
      }
      return Container();
    });
  }
}
