import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/core/error/failure.dart';
import 'package:sunshine/domain/entities/weather.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetCurrentWeatherUseCase mockGetCurrentWeatherUseCase;
  late MockSearchLocationsByCityNameUseCase
      mockSearchLocationsByCityNameUseCase;
  late HomeBloc homeBloc;

  setUp(() {
    mockGetCurrentWeatherUseCase = MockGetCurrentWeatherUseCase();
    mockSearchLocationsByCityNameUseCase = MockSearchLocationsByCityNameUseCase();

    homeBloc = HomeBloc(mockGetCurrentWeatherUseCase,mockSearchLocationsByCityNameUseCase);
  });

  const testWeather = WeatherEntity(
      cityName: 'New York',
      main: 'Clouds',
      description: 'few clouds',
      iconCode: '02d',
      temperature: 302.28,
      pressure: 1009,
      humidity: 70,
      dt: 1703998332,
      country: 'US');

  const String testDatetime = '12/31/2023 11:22 AM';

  const testCityName = 'New York';

  test('initial state should be empty', () {
    expect(homeBloc.state, HomeInitState());
  });

  blocTest<HomeBloc, HomeState>(
      'should emit [WeatherLoading, WeatherLoaded] when data is gotten successfully',
      build: () {
        when(mockGetCurrentWeatherUseCase.execute(testCityName))
            .thenAnswer((_) async => const Right(testWeather));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const OnCityChanged(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () =>
          [WeatherLoading(), const WeatherLoaded(testWeather, testDatetime)]);

  blocTest<HomeBloc, HomeState>(
      'should emit [WeatherLoading, WeatherLoadFailure] when get data is unsuccessful',
      build: () {
        when(mockGetCurrentWeatherUseCase.execute(testCityName)).thenAnswer(
            (_) async => const Left(ServerFailure('Server failure')));
        return homeBloc;
      },
      act: (bloc) => bloc.add(OnCityChanged(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            WeatherLoading(),
            const WeatherLoadFailure('Server failure'),
          ]);
}
