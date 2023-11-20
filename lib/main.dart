import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sunshine/presentation/weather/bloc/weather_bloc.dart';
import 'package:sunshine/presentation/weather/bloc/weather_event.dart';
import 'package:sunshine/presentation/weather/pages/weather_page.dart';

import 'injection_container.dart';
import 'presentation/home/pages/home_page.dart';

void main() {
  setupLocator();
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
            create: (_) => locator<WeatherBloc>(),
          )
        ],
        child: MaterialApp.router(
          title: 'Flutter Demo',
          themeMode: ThemeMode.dark,
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          routerConfig: router,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        ));
  }
}

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, __) => HomePage()),
    GoRoute(
        path: '/weather',
        name: 'weather',
        builder: (context, state) {
          String city = state.uri.queryParameters['city'] ?? "";
          return BlocProvider(
            create: (_) => locator<WeatherBloc>()..add(OnCityChanged(city)),
            child: WeatherPage(
              city: city,
            ),
          );
        })
  ],
);
