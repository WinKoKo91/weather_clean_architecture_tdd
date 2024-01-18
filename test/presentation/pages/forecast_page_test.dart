import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sunshine/data/model/forecast_model.dart';
import 'package:sunshine/domain/entities/forecast_entity.dart';
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart';
import 'package:sunshine/presentation/home/bloc/forecast_event.dart';
import 'package:sunshine/presentation/home/bloc/forecast_state.dart';
import 'package:sunshine/presentation/home/widgets/weather_forecast_widget.dart';

class MockForecastBloc extends MockBloc<ForecastEvent, ForecastState>
    implements ForecastBloc {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockForecastBloc mockForecastBloc;

  setUp(() {
    mockForecastBloc = MockForecastBloc();
    HttpOverrides.global = null;
  });

  ForecastResponseEntity testFiveDayForecastEntity =
  ForecastResponseEntity(code: "200", list: [
    ForecastModel(iconCode: "02d", dt: 1704866400, temperature: 27.57),
    ForecastModel(iconCode: "01d", dt: 1704967200, temperature: 30.0),
    ForecastModel(iconCode: "01n", dt: 1705053600, temperature: 25.87),
    ForecastModel(iconCode: "01n", dt: 1705140000, temperature: 23.51),
    ForecastModel(iconCode: "01n", dt: 1705226400, temperature: 21.96)
  ]);


  Widget makeTestableWidget(Widget body) {
    return BlocProvider<ForecastBloc>(
      create: (context) => mockForecastBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets("text field should trigger state to change from empty to loading",
      (widgetTester) async {
    when(() => mockForecastBloc.state).thenReturn(ForecastInitState());

    await widgetTester.pumpWidget(makeTestableWidget(const WeatherForecastWidget()));

    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets(
    'should show progress indicator when state is loading',
    (widgetTester) async {
      //arrange
      when(() => mockForecastBloc.state).thenReturn(const ForecastLoadingState());

      //act
      await widgetTester.pumpWidget(makeTestableWidget(const WeatherForecastWidget()));

      //assert
      expect(find.byType(Container), findsOneWidget);
    },
  );

  testWidgets(
    'should show widget contain forecast data when state is forecast loaded',
    (widgetTester) async {
      //arrange
      when(() => mockForecastBloc.state)
          .thenReturn( ForecastLoadedState(list: testFiveDayForecastEntity.list ,code: testFiveDayForecastEntity.code));

      //act
      await widgetTester.pumpWidget(makeTestableWidget(const WeatherForecastWidget()));
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 300));
      //assert
      expect(find.byKey(const Key('forecast_data')), findsOneWidget);
    },
  );
}
