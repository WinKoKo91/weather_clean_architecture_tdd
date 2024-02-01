import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'forecast_entity.g.dart';

@HiveType(typeId: 1)
class ForecastResponseEntity extends Equatable {
  @HiveField(0)
  final String code;
  @HiveField(1)
  final List<ForecastEntity> list;

  const ForecastResponseEntity({
    required this.code,
    required this.list,
  });

  @override
  List<Object?> get props => [code, list];
}

@HiveType(typeId: 2)
class ForecastEntity extends Equatable {

  @HiveField(0)
  final String iconCode;

  @HiveField(1)
  final int dt;

  @HiveField(2)
  final int windDegree;

  @HiveField(3)
  final double temperature;

  @HiveField(4)
  final double windSpeed;

  @HiveField(5)
  String? date;

  @HiveField(6)
  String?day;

  @HiveField(7)
  String?hour;

  ForecastEntity({required this.iconCode,
    required this.dt,
    required this.windDegree,
    required this.windSpeed,
    required this.temperature,
    this.hour,
    this.day,
    this.date});

  @override
  List<Object?> get props =>
      [iconCode, dt, temperature, windSpeed, windDegree, date, day, hour];
}
