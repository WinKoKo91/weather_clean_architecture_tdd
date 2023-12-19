import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class OnCitySubmit extends HomeEvent {
  final String cityName;

  const OnCitySubmit(this.cityName);

  @override
  List<Object?> get props => [cityName];
}