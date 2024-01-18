import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sunshine/core/usecase/usecase.dart';
import 'package:sunshine/core/utils/typedef.dart';
import 'package:sunshine/domain/entities/air_pollution_entity.dart';

import '../../core/error/failure.dart';
import '../entities/forecast_entity.dart';
import '../repositories/weather_repository.dart';

class GetTodayAirPollutionUseCase
    extends UseCaseWithParams<AirPollutionResponseEntity, LocationParams> {
  final WeatherRepository weatherRepository;

  GetTodayAirPollutionUseCase(this.weatherRepository);

  @override
  ResultFuture<AirPollutionResponseEntity> call(LocationParams params) {
    return weatherRepository.getAirPollution(lat: params.lat, lon: params.lon);
  }
}

class LocationParams extends Equatable {
  final double lat, lon;

  const LocationParams(this.lat, this.lon);

  @override
  List<Object?> get props => [lat, lon];
}
