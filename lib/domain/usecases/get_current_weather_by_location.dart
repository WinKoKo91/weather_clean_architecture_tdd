import 'package:equatable/equatable.dart';

import '../../core/usecase/usecase.dart';
import '../../core/utils/typedef.dart';
import '../entities/weather_entity.dart';
import '../repositories/weather_repository.dart';

class GetCurrentWeatherByLocationUseCase
    extends UseCaseWithParams<WeatherEntity, CurrentLocationsParams> {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherByLocationUseCase(this.weatherRepository);

  @override
  ResultFuture<WeatherEntity> call(CurrentLocationsParams params) {
    return weatherRepository.getCurrentWeatherByLocation(
        lat: params.lat, lon: params.lon);
  }
}

class CurrentLocationsParams extends Equatable {
  final double? lat, lon;

  const CurrentLocationsParams({ this.lat,  this.lon});

  @override
  List<Object?> get props => [lat, lon];
}
