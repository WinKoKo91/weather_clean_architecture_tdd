import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ForecastEntity extends Equatable {
  final String iconCode;
  final int dt;
  final double temperature;
   String? date, day;

   ForecastEntity(
      {required this.iconCode,
      required this.dt,
      required this.temperature,
      this.day,
      this.date});

  @override
  List<Object?> get props => [iconCode, dt, temperature, date, day];
}
