import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/constants.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';

class WeatherWidget extends StatelessWidget {
  WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is WeatherLoaded) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                key: const Key('weather_data'),
                children: [
                  const Text(
                    "Now",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${state.result.temperature}°C",
                        style: const TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                      Image(
                        image: NetworkImage(
                          Urls.weatherIcon(
                            state.result.iconCode,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${state.result.main} | ${state.result.description}',
                    style: const TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8.0),
                  Divider(),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey,),
                      SizedBox(
                        width: 8,
                      ),
                      Text(state.dateTime),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.grey,),
                      SizedBox(
                        width: 8,
                      ),
                      Text("${state.result.cityName}, ${state.result.country}"),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        if (state is WeatherLoadFailure) {
          return Center(
            child: Text(state.message),
          );
        }
        return Container();
      },
    );
  }
}
