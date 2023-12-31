import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sunshine/core/utils/debouncer.dart';
import 'package:sunshine/domain/entities/location.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/weather_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  String? cityName;

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
          preferredSize:const Size(double.infinity, kToolbarHeight),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: const SearchBarWidget(),
          ),
        ),
      ),
      body:  Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child:  Column(
          children: [
             WeatherWidget(),
          ],
        ),
      ),
    );
  }
}
