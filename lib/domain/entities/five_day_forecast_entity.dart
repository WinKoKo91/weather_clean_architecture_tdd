import 'package:equatable/equatable.dart';

import 'forecast_entity.dart';

class FiveDayForecastEntity extends Equatable {
  final String code;
  final List<ForecastEntity> list;

  const FiveDayForecastEntity({
    required this.code,
    required this.list,
  });

  @override
  List<Object?> get props => [code, list];
}
