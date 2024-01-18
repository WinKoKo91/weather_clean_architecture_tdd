import 'package:equatable/equatable.dart';

abstract class AirPollutionEvent extends Equatable {
  const AirPollutionEvent();

  @override
  List<Object?> get props => [];
}

class OnGetAirPollutionEvent extends AirPollutionEvent {
  final double lat, lon;

  const OnGetAirPollutionEvent({required this.lat,required this.lon});

  @override
  List<Object?> get props => [lat, lon];
}
