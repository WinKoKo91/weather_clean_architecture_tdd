import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sunshine/core/utils/app_bloc_observer.dart';
import 'package:sunshine/presentation/home/bloc/air_pollution_bloc.dart';
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/location_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'injection_container.dart';
import 'presentation/home/pages/home_page.dart';

void main() {
  setPathUrlStrategy();
  setupLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<HomeBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<ForecastBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<AirPollutionBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<LocationBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Sun Shine',
        themeMode: ThemeMode.dark,
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, __) => const HomePage(), routes: []),
  ],
);
