import '../../core/usecase/usecase.dart';
import '../../core/utils/typedef.dart';
import '../entities/weather_entity.dart';
import '../repositories/weather_repository.dart';

class GetCurrentWeatherByNameUseCase
    extends UseCaseWithParams<WeatherEntity, String> {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherByNameUseCase(this.weatherRepository);

  @override
  ResultFuture<WeatherEntity> call(String params) {
    return weatherRepository.getCurrentWeather(params);
  }
}
