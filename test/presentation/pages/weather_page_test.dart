import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sunshine/domain/entities/weather.dart';
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart';
import 'package:sunshine/presentation/home/bloc/forecast_state.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';
import 'package:sunshine/presentation/home/pages/mobile/home_mobile_page.dart';

import 'forecast_page_test.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockHomeBloc mockHomeBloc;
  late MockForecastBloc mockForecastBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    mockForecastBloc = MockForecastBloc();
    HttpOverrides.global = null;
  });

  const testWeather = WeatherEntity(
      cityName: 'New York',
      main: 'Clouds',
      description: 'few clouds',
      iconCode: '02d',
      temperature: 302.28,
      pressure: 1009,
      humidity: 70,
      country: 'US',
      lat: 16.7993,
      sunset: 1705404094,
      sunrise: 1705363655,      feelsLike: 32.5,
      visibility: 8000,
      lon: 96.1583,
      dt: 1703998332);

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => mockHomeBloc,
        ),
        BlocProvider<ForecastBloc>(
          create: (context) => mockForecastBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets("App Bar should trigger state to change from empty to loading",
      (widgetTester) async {
    when(() => mockHomeBloc.state).thenReturn(HomeInitState());
    when(() => mockForecastBloc.state).thenReturn(ForecastInitState());

    await widgetTester.pumpWidget(makeTestableWidget(const HomeMobilePage()));

    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets(
    'should show progress indicator when state is loading',
    (widgetTester) async {
      //arrange
      when(() => mockHomeBloc.state).thenReturn(WeatherLoading());
      when(() => mockForecastBloc.state).thenReturn(ForecastInitState());
      //act
      await widgetTester.pumpWidget(makeTestableWidget(const HomeMobilePage()));

      //assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'should show widget contain weather data when state is weather loaded',
    (widgetTester) async {
      //arrange
      when(() => mockHomeBloc.state).thenReturn(const WeatherLoaded(
          testWeather, '12/31/2023 11:22 AM', '6:37 AM', '5:51 PM'));
      when(() => mockForecastBloc.state).thenReturn(ForecastInitState());

      //act
      await widgetTester.pumpWidget(makeTestableWidget(const HomeMobilePage()));
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 300));
      //assert
      expect(find.byKey(const Key('weather_data')), findsOneWidget);
    },
  );
}
