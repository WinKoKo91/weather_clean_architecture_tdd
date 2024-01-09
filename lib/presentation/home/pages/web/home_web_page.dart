import 'package:flutter/material.dart';

import '../../widgets/search_bar_widget.dart';
import '../../widgets/weather_widget.dart';

class HomeWebPage extends StatelessWidget {
  const HomeWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        leading: Row(
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
        leadingWidth: 200,

        toolbarHeight: 80,
        title: SearchBarWidget(),
      ),

      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              Flexible(
                  child: SizedBox(width: width * 0.4, child: WeatherWidget())),
            ],
          ),
        ),
      ),
    );
  }
}
