import 'package:flutter/material.dart';
import 'package:sunshine/presentation/home/widgets/powered_by_widget.dart';

import '../../widgets/hourly_forecast_widget.dart';
import '../../widgets/today_highlights_widget.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/weather_forecast_widget.dart';
import '../../widgets/weather_widget.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo/sunshine_dart_logo.png',
              height: 40,
              width: 40,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text("Sunshine"),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: const SearchBarWidget(),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WeatherWidget(),
            WeatherForecastWidget(),
            TodayHighlightsWidget(),
            HourlyForecastWidget(),
            PoweredByWidget(),
          ],
        ),
      ),
    );
  }
}
