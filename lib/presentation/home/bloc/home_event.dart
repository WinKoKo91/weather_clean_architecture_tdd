import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class GetWeatherByName extends HomeEvent {
  final String cityName;

  const GetWeatherByName(this.cityName);

  @override
  List<Object?> get props => [cityName];
}

class WeatherByLocation extends HomeEvent {
  final double lat, lon;

  const WeatherByLocation(this.lat, this.lon);

  @override
  List<Object?> get props => [lat, lon];
}


class GetForecastEvent extends HomeEvent {
  final double lat, lon;

  const GetForecastEvent({required this.lat,required this.lon});

  @override
  List<Object?> get props => [lat, lon];
}
