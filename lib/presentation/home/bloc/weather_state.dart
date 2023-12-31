import 'package:equatable/equatable.dart';

import '../../../domain/entities/weather.dart';


abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity result;
  final String dateTime;

  const WeatherLoaded(this.result, this.dateTime);

  @override
  List<Object?> get props => [result, dateTime];
}

class WeatherLoadFailure extends WeatherState {
  final String message;

  const WeatherLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
