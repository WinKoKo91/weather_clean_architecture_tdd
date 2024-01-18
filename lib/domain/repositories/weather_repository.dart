import 'package:sunshine/domain/entities/air_pollution_entity.dart';

import '../../core/utils/typedef.dart';
import '../entities/forecast_entity.dart';
import '../entities/weather.dart';

abstract class WeatherRepository {
  ResultFuture<WeatherEntity> getCurrentWeather(String cityName);

  ResultFuture<ForecastResponseEntity> getFiveDayForecast(
      {required double lat, required double lon});

  ResultFuture<AirPollutionResponseEntity> getAirPollution(
      {required double lat, required double lon});
}
