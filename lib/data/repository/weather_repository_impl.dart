import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:sunshine/domain/entities/air_pollution_entity.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../core/utils/typedef.dart';
import '../../domain/entities/forecast_entity.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasource/local/weather_local_data_source.dart';
import '../datasource/remote/weather_remote_data_source.dart';
import '../model/air_pollution_model.dart';
import '../model/forecast_model.dart';
import '../model/weather_model.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  final WeatherLocalDataSource weatherLocalDataSource;
  final Future<bool> Function() isOnline;

  WeatherRepositoryImpl(
      {required this.weatherRemoteDataSource,
      required this.weatherLocalDataSource,
      required this.isOnline});

  @override
  ResultFuture<WeatherEntity> getCurrentWeather(String cityName) async {
    try {
      if (await isOnline()) {
        WeatherModel? data =
            await weatherRemoteDataSource.getCurrentWeather(cityName);
        await weatherLocalDataSource.saveCurrentWeather(data);
        return Right(data.toEntity());
      } else {
        WeatherEntity? data = weatherLocalDataSource.getCurrentWeather();
        if (data == null) {
          throw SocketException;
        }
        return Right(data);
      }
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message ?? "An error has occurred"));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  ResultFuture<ForecastResponseEntity> getFiveDayForecast(
      {required double lat, required double lon}) async {
    try {
      if (await isOnline()) {
        ForecastResponseModel? result = await weatherRemoteDataSource
            .getFiveDayForecast(lat: lat, lon: lon);
        await weatherLocalDataSource.saveFiveDayForecast(result);
        return Right(result.toEntity());
      } else {
        ForecastResponseEntity? result =
            weatherLocalDataSource.getFiveDayForecast();
        if (result == null) {
          throw SocketException;
        }
        return Right(result);
      }
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message ?? "An error has occurred"));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  ResultFuture<AirPollutionResponseEntity> getAirPollution(
      {required double lat, required double lon}) async {
    try {
      if (await isOnline()) {
        AirPollutionResponseModel? result =
            await weatherRemoteDataSource.getAirPollution(lat: lat, lon: lon);
        await weatherLocalDataSource.saveAirPollution(result);
        return Right(result!.toEntity());
      } else {
        AirPollutionResponseEntity result =
            weatherLocalDataSource.getAirPollution();
        if (result == null) {
          throw SocketException;
        }
        return Right(result);
      }
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message ?? "An error has occurred"));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  ResultFuture<WeatherEntity> getCurrentWeatherByLocation(
      {double? lat, double? lon}) async {
    try {
      if (await isOnline()) {
        WeatherModel? result = await weatherRemoteDataSource
            .getCurrentWeatherByLocation(lat: lat!, lon: lon!);

        await weatherLocalDataSource.saveCurrentWeather(result);
        return Right(result.toEntity());
      } else {
        WeatherEntity? result =
            weatherLocalDataSource.getCurrentWeatherByLocation();
        if (result == null) {
          throw SocketException;
        }
        return Right(result);
      }
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message ?? "An error has occurred"));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
