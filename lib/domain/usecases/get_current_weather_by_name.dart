import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../../core/utils/typedef.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetCurrentWeatherByNameUseCase {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherByNameUseCase(this.weatherRepository);

  Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}
