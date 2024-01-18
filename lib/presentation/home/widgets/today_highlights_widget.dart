import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunshine/domain/entities/air_pollution_entity.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';

import '../bloc/air_pollution_bloc.dart';
import '../bloc/air_pollution_state.dart';

class TodayHighlightsWidget extends StatelessWidget {
  const TodayHighlightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('today_highlights_data'),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: const Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today Highlights',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              AirQualityWidget(),
              SunriseAndSunsetWidget(),
              HumidityWidget(),
              PressureWidget(),
              VisibilityWidget(),
              FeelsLikeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class AirQualityWidget extends StatelessWidget {
  const AirQualityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AirPollutionBloc, AirPollutionState>(
        builder: (context, state) {
      if (state is AirPollutionFailState) {
        return Text(state.errorMessage);
      }

      if (state is AirPollutionLoadedState) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background.withOpacity(0.4),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Air Quality Index',
                      style: TextStyle(color: Colors.grey, fontSize: 15)),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: state.qualitativeColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      state.qualitativeName!,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.air,
                    size: 32,
                  ),
                  Column(
                    children: [
                      AirQualityTypeWidget(
                        value: state.data.pm2_5.toString(),
                        type: 'PM2.5',
                      ),
                      AirQualityTypeWidget(
                        value: state.data.no2.toString(),
                        type: 'NO2',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      AirQualityTypeWidget(
                        value: state.data.so2.toString(),
                        type: 'SO2',
                      ),
                      AirQualityTypeWidget(
                        value: state.data.o3.toString(),
                        type: 'O3',
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}

class AirQualityTypeWidget extends StatelessWidget {
  const AirQualityTypeWidget({
    super.key,
    required this.value,
    required this.type,
  });

  final String value;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          type,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}

class SunriseAndSunsetWidget extends StatelessWidget {
  const SunriseAndSunsetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sunrise & Sunset',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.sunny,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Sunrise',
                              style: TextStyle(color: Colors.grey)),
                          Text(
                            state.sunrise,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.nights_stay_outlined,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Sunrise',
                              style: TextStyle(color: Colors.grey)),
                          Text(
                            state.sunset,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}

class HumidityWidget extends StatelessWidget {
  const HumidityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        return Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Humidity',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icon/icon_humidity_percentage.svg',
                    height: 32,
                    width: 32,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        state.result.humidity.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        '%',
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}

class PressureWidget extends StatelessWidget {
  const PressureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        return Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pressure',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icon/icon_airwave.svg',
                    height: 32,
                    width: 32,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        state.result.pressure.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        'hPa',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}

class VisibilityWidget extends StatelessWidget {
  const VisibilityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        return Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Visibility',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.visibility_outlined,
                    size: 32,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${state.result.visibility / 1000}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        'km',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}

class FeelsLikeWidget extends StatelessWidget {
  const FeelsLikeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        return Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Feels Like',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.thermostat,
                    size: 32,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        state.result.feelsLike.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        '°C',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}
