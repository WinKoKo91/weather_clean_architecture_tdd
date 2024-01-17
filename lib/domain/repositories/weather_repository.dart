import 'package:sunshine/domain/entities/five_day_forecast_entity.dart';
import '../../core/utils/typedef.dart';
import '../entities/weather.dart';

abstract class WeatherRepository {
  ResultFuture<WeatherEntity> getCurrentWeather(String cityName);

  ResultFuture<FiveDayForecastEntity> getFiveDayForecast(
      {required double lat, required double lon});
}
