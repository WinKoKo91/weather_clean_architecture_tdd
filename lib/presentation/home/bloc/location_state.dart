import 'package:equatable/equatable.dart';

import '../../../domain/entities/forecast_entity.dart';
import '../../../domain/entities/location.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationInitState extends LocationState {}

class LocationSearchSuccessState extends LocationState {
  final List<LocationEntity> locations;

  const LocationSearchSuccessState(this.locations);

  @override
  List<Object?> get props => [locations];
}

class LocationSearchingState extends LocationState {}

class LocationFailState extends LocationState {
  final String errorMessage;

  const LocationFailState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
