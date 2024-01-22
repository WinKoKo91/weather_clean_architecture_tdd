import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../../core/utils/typedef.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetCurrentWeatherByNameUseCase   extends UseCaseWithParams<WeatherEntity, String> {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherByNameUseCase(this.weatherRepository);

  @override
  Future<Either<Failure, WeatherEntity>> call(String params) {
    return weatherRepository.getCurrentWeather(params);
  }
}
