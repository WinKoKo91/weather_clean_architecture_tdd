import 'package:flutter/material.dart';

import '../../widgets/hourly_forecast_widget.dart';
import '../../widgets/powered_by_widget.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/today_highlights_widget.dart';
import '../../widgets/weather_forecast_widget.dart';
import '../../widgets/weather_widget.dart';

class HomeWebPage extends StatelessWidget {
  const HomeWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              'assets/logo/sunshine_dart_logo.png',
              height: 40,
              width: 40,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "Sunshine",
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
        leadingWidth: 200,
        toolbarHeight: 80,
        title: SearchBarWidget(),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: ListView(
          children: const [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        WeatherWidget(),
                        WeatherForecastWidget(),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TodayHighlightsWidget(),
                        HourlyForecastWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            PoweredByWidget(),
          ],
        ),
      ),
    );
  }
}
