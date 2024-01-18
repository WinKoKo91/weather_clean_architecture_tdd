import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName, country, main, description, iconCode;
  final int pressure, humidity, dt, sunrise, sunset, visibility;
  final double temperature, lat, lon, feelsLike;

  const WeatherEntity(
      {required this.cityName,
      required this.country,
      required this.main,
      required this.description,
      required this.iconCode,
      required this.pressure,
      required this.humidity,
      required this.dt,
      required this.lat,
      required this.lon,
      required this.sunrise,
      required this.sunset,
      required this.visibility,
      required this.feelsLike,
      required this.temperature});

  @override
  List<Object?> get props => [
        cityName,
        country,
        main,
        description,
        iconCode,
        pressure,
        humidity,
        dt,
        temperature,
        lat,
        lon,
        visibility,
        feelsLike,
        sunrise,
        sunrise
      ];
}
