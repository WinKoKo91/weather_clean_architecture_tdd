import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sunshine/domain/entities/air_pollution_entity.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../core/utils/typedef.dart';
import '../../domain/entities/forecast_entity.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasource/weather_remote_data_source.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  @override
  ResultFuture< WeatherEntity> getCurrentWeather(
      String cityName) async {
    try {
      final result = await weatherRemoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message??"An error has occurred"));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  ResultFuture<ForecastResponseEntity> getFiveDayForecast({required double lat, required double lon}) async {
    try {
      final result = await weatherRemoteDataSource.getFiveDayForecast(lat:lat, lon:lon);
      return Right(result.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message??"An error has occurred"));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  ResultFuture<AirPollutionResponseEntity> getAirPollution({required double lat, required double lon}) async{
    try {
      final result = await weatherRemoteDataSource.getAirPollution(lat:lat, lon:lon);
      return Right(result.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message??"An error has occurred"));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  ResultFuture<WeatherEntity> getCurrentWeatherByLocation({required double lat, required double lon}) async {
    try {
      final result = await weatherRemoteDataSource.getCurrentWeatherByLocation(lat:lat, lon:lon);
      return Right(result.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message??"An error has occurred"));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }


}
