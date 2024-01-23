import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';

import 'today_highlights/widgets.dart';

class TodayHighlightsWidget extends StatelessWidget {
  const TodayHighlightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        return Container(
          key: const Key('today_highlights_data'),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Today Highlights',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const AirQualityWidget(),
                  SunriseAndSunsetWidget(
                    sunset: state.sunset,
                    sunrise: state.sunrise,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: HumidityWidget(
                          humidity: state.data.humidity.toString(),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: PressureWidget(
                              pressure: state.data.pressure.toString())),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child:
                              VisibilityWidget(visibility: state.visibility)),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: FeelsLikeWidget(
                            feelsLike: state.data.feelsLike.toString()),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
      return Container();
    });
  }
}
