
import 'package:equatable/equatable.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class OnCitySubmit extends LocationEvent {
  final String cityName;

  const OnCitySubmit(this.cityName);

  @override
  List<Object?> get props => [cityName];
}

