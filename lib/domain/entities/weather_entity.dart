import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'weather_entity.g.dart';

@HiveType(typeId: 0)
class WeatherEntity extends Equatable{

  @HiveField(0)
  final String cityName;
  @HiveField(1)
  final String country;
  @HiveField(2)
  final String main;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String iconCode;
  @HiveField(5)
  final int pressure;
  @HiveField(6)
  final int humidity;
  @HiveField(7)
  final int dt;
  @HiveField(8)
  final int sunrise;
  @HiveField(9)
  final int sunset;
  @HiveField(10)
  final int visibility;
  @HiveField(11)
  final double temperature;
  @HiveField(12)
  final double lat;
  @HiveField(13)
  final double lon;
  @HiveField(14)
  final double feelsLike;

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
