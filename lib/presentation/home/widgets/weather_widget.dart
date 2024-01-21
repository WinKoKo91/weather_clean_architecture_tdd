import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is WeatherLoaded) {}
      },
      builder: (context, state) {
        if (state is WeatherLoadFailure) {
          return Text(state.message);
        }

        if (state is WeatherLoaded) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
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
                          "${state.data.temperature}°C",
                          style: const TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold),
                        ),
                        Image(
                          image: NetworkImage(
                            Urls.weatherIcon(
                              state.data.iconCode,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${state.data.main} | ${state.data.description}',
                      style: const TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8.0),
                    const Divider(),
                    const SizedBox(height: 12.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(state.dateTime),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text("${state.data.cityName}, ${state.data.country}"),
                      ],
                    ),
                  ],
                ),
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
