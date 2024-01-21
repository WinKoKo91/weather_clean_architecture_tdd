import 'package:equatable/equatable.dart';

class ForecastResponseEntity extends Equatable {
  final String code;
  final List<ForecastEntity> list;

  const ForecastResponseEntity({
    required this.code,
    required this.list,
  });

  @override
  List<Object?> get props => [code, list];
}

class ForecastEntity extends Equatable {
  final String iconCode;
  final int dt, windDegree;
  final double temperature, windSpeed;

  String? date, day, hour;

  ForecastEntity(
      {required this.iconCode,
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
