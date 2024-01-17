import 'package:equatable/equatable.dart';

abstract class ForecastEvent extends Equatable {
  const ForecastEvent();

  @override
  List<Object?> get props => [];
}

class OnGetForecastEvent extends ForecastEvent {
  final double lat, lon;

  const OnGetForecastEvent({required this.lat,required this.lon});

  @override
  List<Object?> get props => [lat, lon];
}
