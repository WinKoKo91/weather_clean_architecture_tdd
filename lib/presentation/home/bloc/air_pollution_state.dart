import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../../../domain/entities/air_pollution_entity.dart';

abstract class AirPollutionState extends Equatable {
  const AirPollutionState();

  @override
  List<Object?> get props => [];
}

class AirPollutionInitState extends AirPollutionState {}

class AirPollutionFailState extends AirPollutionState {
  final String errorMessage;

  const AirPollutionFailState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class AirPollutionLoadingState extends AirPollutionState {
  const AirPollutionLoadingState();
}

class AirPollutionLoadedState extends AirPollutionState {
  final AirPollutionEntity data;
  final String? qualitativeName;
  final Color? qualitativeColor;

  const AirPollutionLoadedState({
    required this.data,
    this.qualitativeName,
    this.qualitativeColor,
  });

  @override
  List<Object?> get props => [data, qualitativeName];
}
