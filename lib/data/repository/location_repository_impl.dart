import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sunshine/domain/entities/location.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../core/utils/typedef.dart';
import '../../domain/repositories/location_repository.dart';
import '../datasource/location_remote_data_source.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationRemoteDataSource locationRemoteDataSource;

  LocationRepositoryImpl({required this.locationRemoteDataSource});

  @override
  ResultFuture<List<LocationEntity>> searchCityListByName(
      String cityName) async {
    try {
      final result =
          await locationRemoteDataSource.searchCityListByName(cityName);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message ?? "An error has occurred"));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
