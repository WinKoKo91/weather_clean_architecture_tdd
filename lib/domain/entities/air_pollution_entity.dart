import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'air_pollution_entity.g.dart';

@HiveType(typeId: 3)
class AirPollutionResponseEntity extends Equatable {
  @HiveField(0)
  final List<AirPollutionEntity> list;

  const AirPollutionResponseEntity({required this.list});

  @override
  List<Object?> get props => [list];
}

@HiveType(typeId: 4)
class AirPollutionEntity extends Equatable {

  @HiveField(0)
  final int aqi;
  @HiveField(1)
  final double no2;
  @HiveField(2)
  final double o3;
  @HiveField(3)
  final double so2;
  @HiveField(4)
  final double pm2_5;
  @HiveField(5)
  final int dt;

  const AirPollutionEntity(
      {required this.aqi,
      required this.no2,
      required this.o3,
      required this.so2,
      required this.pm2_5,
      required this.dt});

  @override
  List<Object?> get props => [aqi, no2, o3, so2, pm2_5, dt];
}
