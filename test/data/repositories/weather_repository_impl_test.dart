import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/core/error/exception.dart';
import 'package:sunshine/core/error/failure.dart';
import 'package:sunshine/data/model/five_day_forecast_model.dart';
import 'package:sunshine/data/model/forecast_model.dart';
import 'package:sunshine/data/model/location_model.dart';
import 'package:sunshine/data/model/weather_model.dart';
import 'package:sunshine/data/repository/weather_repository_impl.dart';
import 'package:sunshine/domain/entities/five_day_forecast_entity.dart';
import 'package:sunshine/domain/entities/forecast_entity.dart';
import 'package:sunshine/domain/entities/location.dart';
import 'package:sunshine/domain/entities/weather.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepositoryImpl = WeatherRepositoryImpl(
      weatherRemoteDataSource: mockWeatherRemoteDataSource,
    );
  });

  const testWeatherModel = WeatherModel(
    cityName: 'Yangon',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
    dt: 1703998332,
    country: 'MM',
    lat: 16.7993,
    lon: 96.1583,
  );

  const testWeatherEntity = WeatherEntity(
    cityName: 'Yangon',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
    dt: 1703998332,
    lat: 16.7993,
    lon: 96.1583,
    country: 'MM',
  );

  const testCityName = 'New York';

  group('get current weather', () {
    test(
      'should return current weather when a call to data source is successful',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
            .thenAnswer((_) async => testWeatherModel);

        // act
        final result =
            await weatherRepositoryImpl.getCurrentWeather(testCityName);

        // assert
        expect(result, equals(const Right(testWeatherEntity)));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
            .thenThrow(ServerException());

        // act
        final result =
            await weatherRepositoryImpl.getCurrentWeather(testCityName);

        // assert
        expect(
            result, equals(const Left(ServerFailure('An error has occurred'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
            .thenThrow(
                const SocketException('Failed to connect to the network'));

        // act
        final result =
            await weatherRepositoryImpl.getCurrentWeather(testCityName);

        // assert
        expect(
            result,
            equals(const Left(
                ConnectionFailure('Failed to connect to the network'))));
      },
    );
  });

  double testLat = 16.7967129;
  double testLon = 96.1609916;

  FiveDayForecastModel testFiveDayForecastModel =
      FiveDayForecastModel(code: "200", list: [
    ForecastModel(iconCode: "02d", dt: 1704866400, temperature: 27.57),
    ForecastModel(iconCode: "01d", dt: 1704877200, temperature: 30.0),
    ForecastModel(iconCode: "01n", dt: 1704888000, temperature: 25.87),
    ForecastModel(iconCode: "01n", dt: 1704898800, temperature: 23.51),
    ForecastModel(iconCode: "01n", dt: 1704909600, temperature: 21.96)
  ]);

  FiveDayForecastEntity testFiveDayForecastEntity =
      FiveDayForecastEntity(code: "200", list: [
    ForecastModel(iconCode: "02d", dt: 1704866400, temperature: 27.57),
    ForecastModel(iconCode: "01d", dt: 1704877200, temperature: 30.0),
    ForecastModel(iconCode: "01n", dt: 1704888000, temperature: 25.87),
    ForecastModel(iconCode: "01n", dt: 1704898800, temperature: 23.51),
    ForecastModel(iconCode: "01n", dt: 1704909600, temperature: 21.96)
  ]);

  group('get five day forecast', () {
    test(
      'should return current five day forecast when a call to data source is successful',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getFiveDayForecast(lat: testLat, lon: testLon))
            .thenAnswer((_) async => testFiveDayForecastModel);

        // act
        final result =
            await weatherRepositoryImpl.getFiveDayForecast(lat: testLat, lon: testLon);

        // assert
        expect(result, equals(Right(testFiveDayForecastEntity)));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getFiveDayForecast(lon: testLon, lat: testLat))
            .thenThrow(ServerException());

        // act
        final result =
            await weatherRepositoryImpl.getFiveDayForecast(lat: testLat, lon: testLon);

        // assert
        expect(
            result, equals(const Left(ServerFailure('An error has occurred'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockWeatherRemoteDataSource.getFiveDayForecast(lat: testLat, lon: testLon))
            .thenThrow(
                const SocketException('Failed to connect to the network'));

        // act
        final result =
            await weatherRepositoryImpl.getFiveDayForecast(lat: testLat, lon: testLon);

        // assert
        expect(
            result,
            equals(const Left(
                ConnectionFailure('Failed to connect to the network'))));
      },
    );
  });
}
