import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sunshine/core/usecase/usecase.dart';
import 'package:sunshine/core/utils/typedef.dart';
import 'package:sunshine/data/model/forecast_model.dart';

import '../../core/error/failure.dart';
import '../entities/forecast_entity.dart';
import '../repositories/weather_repository.dart';

class GetFiveDayForecastUseCase extends UseCaseWithParams<
    ForecastResponseEntity, GetFiveDayForecastParams> {
  final WeatherRepository weatherRepository;

  GetFiveDayForecastUseCase(this.weatherRepository);

  @override
  ResultFuture<ForecastResponseEntity> call(GetFiveDayForecastParams params) {
    return weatherRepository.getFiveDayForecast(
        lat: params.lat, lon: params.lon);
  }
}

class GetFiveDayForecastParams extends Equatable {
  final double lat, lon;

  const GetFiveDayForecastParams(this.lat, this.lon);

  @override
  List<Object?> get props => [lat, lon];
}
