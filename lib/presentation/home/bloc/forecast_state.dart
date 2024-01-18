import 'package:equatable/equatable.dart';

import '../../../domain/entities/forecast_entity.dart';

abstract class ForecastState extends Equatable {
  const ForecastState();

  @override
  List<Object?> get props => [];
}

class ForecastInitState extends ForecastState {}

class ForecastFailState extends ForecastState {
  final String errorMessage;

  const ForecastFailState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ForecastLoadingState extends ForecastState {
  const ForecastLoadingState();
}


class ForecastLoadedState extends ForecastState {
  final String code;
  final List<ForecastEntity> list;

  const ForecastLoadedState({required this.list,required this.code});

  @override
  List<Object?> get props => [list, code];
}