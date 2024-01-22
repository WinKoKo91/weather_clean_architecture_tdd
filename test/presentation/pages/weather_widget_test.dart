import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sunshine/domain/entities/weather.dart';
import 'package:sunshine/presentation/home/bloc/air_pollution_bloc.dart';
import 'package:sunshine/presentation/home/bloc/air_pollution_event.dart';
import 'package:sunshine/presentation/home/bloc/air_pollution_state.dart';
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart';
import 'package:sunshine/presentation/home/bloc/forecast_state.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';
import 'package:sunshine/presentation/home/bloc/location_bloc.dart';
import 'package:sunshine/presentation/home/bloc/location_event.dart';
import 'package:sunshine/presentation/home/bloc/location_state.dart';
import 'package:sunshine/presentation/home/pages/mobile/home_mobile_page.dart';
import 'package:sunshine/presentation/home/widgets/weather_widget.dart';

import '../mock_bloc.dart';
import 'forecast_page_test.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockHomeBloc mockHomeBloc;
  late MockForecastBloc mockForecastBloc;
  late MockAirPollutionBloc mockAirPollutionBloc;
  late MockLocationBloc mockLocationBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    mockForecastBloc = MockForecastBloc();
    mockAirPollutionBloc = MockAirPollutionBloc();
    mockLocationBloc = MockLocationBloc();

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
      sunrise: 1705363655,
      feelsLike: 32.5,
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
        BlocProvider<AirPollutionBloc>(
          create: (context) => mockAirPollutionBloc,
        ),
        BlocProvider<LocationBloc>(create: (context) => mockLocationBloc)
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
    when(() => mockLocationBloc.state).thenReturn(LocationInitState());

    await widgetTester.pumpWidget(makeTestableWidget(const HomeMobilePage()));

    expect(find.byType(AppBar), findsOneWidget);
  });

  //TODO: widget test for progress indicator
  testWidgets(
    'should show progress indicator when state is loading',
    (widgetTester) async {
      //arrange
      when(() => mockHomeBloc.state).thenReturn(WeatherLoading());
      when(() => mockForecastBloc.state).thenReturn(ForecastInitState());
      when(() => mockLocationBloc.state).thenReturn(LocationInitState());
      //act
      await widgetTester.pumpWidget(makeTestableWidget(const WeatherWidget()));

      //assert
      expect(find.byType(Container), findsOneWidget);
    },
  );

  testWidgets(
    'should show widget contain weather data when state is weather loaded',
    (widgetTester) async {
      //arrange
      when(() => mockHomeBloc.state).thenReturn(const WeatherLoaded(
        data: testWeather,
        dateTime: '12/31/2023 11:22 AM',
        sunrise: '6:37 AM', //
        sunset: '5:51 PM',
        visibility: '8.0',
      ));
      when(() => mockForecastBloc.state).thenReturn(ForecastInitState());
      when(() => mockAirPollutionBloc.state)
          .thenReturn(AirPollutionInitState());
      when(() => mockLocationBloc.state).thenReturn(LocationInitState());

      //act
      await widgetTester.pumpWidget(makeTestableWidget(const HomeMobilePage()));
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 300));
      //assert
      expect(find.byKey(const Key('weather_data')), findsOneWidget);
    },
  );
}
