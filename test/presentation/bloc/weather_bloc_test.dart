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
  late MockGetCurrentWeatherByNameUseCase mockGetCurrentWeatherByNameUseCase;
  late MockGetCurrentWeatherByLocationUseCase mockGetCurrentWeatherByLocationUseCase;

  late HomeBloc homeBloc;

  setUp(() {
    mockGetCurrentWeatherByNameUseCase = MockGetCurrentWeatherByNameUseCase();
    mockGetCurrentWeatherByLocationUseCase = MockGetCurrentWeatherByLocationUseCase();

    homeBloc = HomeBloc(
        mockGetCurrentWeatherByNameUseCase, mockGetCurrentWeatherByLocationUseCase);
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
      lat: 16.7993,
      lon: 96.1583,
      sunset: 1705404094,
      sunrise: 1705363655,
      feelsLike: 32.5,
      visibility: 8000,
      country: 'US');

  const String testDatetime = '12/31/2023 4:52 AM';  // code magic 4:52 AM, local 11:22 AM

  const testCityName = 'New York';

  test('initial state should be empty', () {
    expect(homeBloc.state, HomeInitState());
  });

  blocTest<HomeBloc, HomeState>(
      'should emit [WeatherLoading, WeatherLoaded] when data is gotten successfully',
      build: () {
        when(mockGetCurrentWeatherByNameUseCase(testCityName))
            .thenAnswer((_) async => const Right(testWeather));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const GetWeatherByName(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            WeatherLoading(),
            const WeatherLoaded(
              data: testWeather,
              dateTime: testDatetime,
              sunrise: '12:07 AM', // code magic 12:07 AM, local 6:37 AM
              sunset: '11:21 AM', // code magic 11:21 AM, local 5:51 PM
              visibility: '8.0',
            )
          ]);

  blocTest<HomeBloc, HomeState>(
      'should emit [WeatherLoading, WeatherLoadFailure] when get data is unsuccessful',
      build: () {
        when(mockGetCurrentWeatherByNameUseCase(testCityName)).thenAnswer(
            (_) async => const Left(ServerFailure('Server failure')));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const GetWeatherByName(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            WeatherLoading(),
            const WeatherLoadFailure('Server failure'),
          ]);
}
