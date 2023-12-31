import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String? name, country, state;
  final double? lat;
  final double? lon;

  const LocationEntity(
      {this.name, this.country, this.state, this.lat, this.lon});

  @override
  List<Object?> get props => [name, country, state, lat, lon];
}
