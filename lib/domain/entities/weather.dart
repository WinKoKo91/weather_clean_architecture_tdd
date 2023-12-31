import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName, country, main, description, iconCode;
  final int pressure, humidity, dt;
  final double temperature;


  const WeatherEntity(
      {required this.cityName,
        required this.country,

      required this.main,
      required this.description,
      required this.iconCode,
      required this.pressure,
      required this.humidity,
        required this.dt,
      required this.temperature});

  @override
  List<Object?> get props =>
      [cityName, country,main, description, iconCode, pressure, humidity, dt,temperature];
}
