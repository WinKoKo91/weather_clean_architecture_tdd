import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/core/error/failure.dart';
import 'package:sunshine/data/model/forecast_model.dart';
import 'package:sunshine/domain/entities/five_day_forecast_entity.dart';
import 'package:sunshine/domain/entities/weather.dart';
import 'package:sunshine/domain/usecases/get_five_day_forecast.dart';
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart';
import 'package:sunshine/presentation/home/bloc/forecast_event.dart';
import 'package:sunshine/presentation/home/bloc/forecast_state.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetFiveDayForecastUseCase mockGetFiveDayForecastUseCase;

  late ForecastBloc forecastBloc;

  setUp(() {
    mockGetFiveDayForecastUseCase = MockGetFiveDayForecastUseCase();

    forecastBloc = ForecastBloc(mockGetFiveDayForecastUseCase);
  });

  double testLat = 16.7967129;
  double testLon = 96.1609916;
  GetFiveDayForecastParams testParams =
      GetFiveDayForecastParams(testLat, testLon);

  FiveDayForecastEntity testFiveDayForecastEntity =
      FiveDayForecastEntity(code: "200", list: [
    ForecastModel(iconCode: "02d", dt: 1704866400, temperature: 27.57),
    ForecastModel(iconCode: "01d", dt: 1704967200, temperature: 30.0),
    ForecastModel(iconCode: "01n", dt: 1705053600, temperature: 25.87),
    ForecastModel(iconCode: "01n", dt: 1705140000, temperature: 23.51),
    ForecastModel(iconCode: "01n", dt: 1705226400, temperature: 21.96)
  ]);



  test('initial state should be empty', () {
    expect(forecastBloc.state, ForecastInitState());
  });

  blocTest<ForecastBloc, ForecastState>(
      'should emit [ForecastLoadingState, ForecastLoadingState] when data is gotten successfully',
      build: () {
        when(mockGetFiveDayForecastUseCase.call(testParams))
            .thenAnswer((_) async => Right(testFiveDayForecastEntity));
        return forecastBloc;
      },
      act: (bloc) => bloc.add(OnGetForecastEvent(lat: testLat, lon: testLon)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            const ForecastLoadingState(),
            ForecastLoadedState(
                code: testFiveDayForecastEntity.code,
                list: testFiveDayForecastEntity.list)
          ]);

  blocTest<ForecastBloc, ForecastState>(
      'should emit [ForecastLoadingState, ForecastFailState] when get data is unsuccessful',
      build: () {
        when(mockGetFiveDayForecastUseCase.call(testParams)).thenAnswer(
            (_) async => const Left(ServerFailure('Server failure')));
        return forecastBloc;
      },
      act: (bloc) => bloc.add(OnGetForecastEvent(lat: testLat, lon: testLon)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            const ForecastLoadingState(),
            const ForecastFailState('Server failure'),
          ]);
}
