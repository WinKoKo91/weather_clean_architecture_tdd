import 'package:equatable/equatable.dart';

import '../../../domain/entities/weather.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitState extends HomeState {}

class HomeFailState extends HomeState {
  final String errorMessage;

  const HomeFailState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}



class WeatherLoaded extends HomeState {
  final WeatherEntity data;
  final String dateTime;
  final String sunset;
  final String sunrise;
  final String visibility;

  const WeatherLoaded(
      {required this.data,required this.dateTime,required this.sunrise,required this.sunset,required this.visibility});

  @override
  List<Object?> get props => [data, dateTime, sunrise, sunset,visibility];
}

class WeatherLoadFailure extends HomeState {
  final String message;

  const WeatherLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class WeatherLoading extends HomeState {}
