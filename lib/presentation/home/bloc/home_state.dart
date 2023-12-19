import 'package:equatable/equatable.dart';

import '../../../domain/entities/weather.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final String cityName;

  const HomeSuccessState(this.cityName);

  @override
  List<Object?> get props => [cityName];
}

class HomeFailState extends HomeState {
  final String errorMessage;

  const HomeFailState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class HomeQueryWeather extends HomeState {}
