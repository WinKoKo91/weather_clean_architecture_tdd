import 'package:equatable/equatable.dart';

class AirPollutionResponseEntity extends Equatable {
  final List<AirPollutionEntity> list;

  const AirPollutionResponseEntity({required this.list});

  @override
  List<Object?> get props => [list];
}

class AirPollutionEntity extends Equatable {
  final int aqi;
  final double no2;
  final double o3;
  final double so2;
  final double pm2_5;
  final int dt;

  const AirPollutionEntity({required this.aqi, required this.no2,required this.o3,required this.so2,required this.pm2_5, required this.dt});

  @override
  List<Object?> get props => [aqi, no2, o3, so2, pm2_5, dt];
}
