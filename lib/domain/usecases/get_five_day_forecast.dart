import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sunshine/core/usecase/usecase.dart';
import 'package:sunshine/core/utils/typedef.dart';
import 'package:sunshine/domain/entities/five_day_forecast_entity.dart';

import '../../core/error/failure.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetFiveDayForecastUseCase extends UseCaseWithParams<FiveDayForecastEntity,GetFiveDayForecastParams > {
  final WeatherRepository weatherRepository;

  GetFiveDayForecastUseCase(this.weatherRepository);


  Future<Either<Failure, FiveDayForecastEntity>> execute(
      double lat, double lon) {
    return weatherRepository.getFiveDayForecast(lat: lat, lon: lon);
  }

  @override
  ResultFuture<FiveDayForecastEntity> call(GetFiveDayForecastParams params) {
    return weatherRepository.getFiveDayForecast(lat: params.lat, lon: params.lon);
  }
}


class GetFiveDayForecastParams extends Equatable {
  final double lat, lon;

  const GetFiveDayForecastParams(this.lat, this.lon);

  @override
  List<Object?> get props => [lat, lon];
}

