import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName, main, description, iconCode;
  final int pressure, humidity;
  final double temperature;

  const WeatherEntity(
      {required this.cityName,
      required this.main,
      required this.description,
      required this.iconCode,
      required this.pressure,
      required this.humidity,
      required this.temperature});

  @override
  List<Object?> get props =>
      [cityName, main, description, iconCode, pressure, humidity, temperature];
}
