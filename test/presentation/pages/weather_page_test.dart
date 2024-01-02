import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sunshine/domain/entities/weather.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';
import 'package:sunshine/presentation/home/pages/home_page.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState>
    implements HomeBloc {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
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
      dt: 1703998332);

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<HomeBloc>(
      create: (context) => mockHomeBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets("text field should trigger state to change from empty to loading",
      (widgetTester) async {
    when(() => mockHomeBloc.state).thenReturn(HomeInitState());

    await widgetTester.pumpWidget(makeTestableWidget(HomePage()));

    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets(
    'should show progress indicator when state is loading',
    (widgetTester) async {
      //arrange
      when(() => mockHomeBloc.state).thenReturn(WeatherLoading());

      //act
      await widgetTester.pumpWidget(makeTestableWidget(HomePage()));

      //assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'should show widget contain weather data when state is weather loaded',
    (widgetTester) async {
      //arrange
      when(() => mockHomeBloc.state)
          .thenReturn(const WeatherLoaded(testWeather,'12/31/2023 11:22 AM'));

      //act
      await widgetTester.pumpWidget(makeTestableWidget(HomePage()));
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 300));
      //assert
      expect(find.byKey(const Key('weather_data')), findsOneWidget);
    },
  );
}
