import 'package:equatable/equatable.dart';

import '../../../domain/entities/location.dart';
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

class LocationSearchSuccessState extends HomeState {
  final List<LocationEntity> locations;

  const LocationSearchSuccessState(this.locations);

  @override
  List<Object?> get props => [locations];
}

class LocationSearchingState extends HomeState {}


class WeatherLoaded extends HomeState {
  final WeatherEntity result;
  final String dateTime;

  const WeatherLoaded(this.result, this.dateTime);

  @override
  List<Object?> get props => [result, dateTime];
}



class WeatherLoadFailure extends HomeState {
  final String message;

  const WeatherLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}


class WeatherLoading extends HomeState {}

