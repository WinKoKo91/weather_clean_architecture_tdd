import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/transformers.dart';
import 'package:sunshine/domain/entities/weather.dart';
import 'package:sunshine/domain/usecases/get_current_weather_by_location.dart';

import '../../../domain/usecases/get_current_weather_by_name.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherByNameUseCase _getCurrentWeatherUserCase;
  final GetCurrentWeatherByLocationUseCase _getCurrentWeatherByLocationUseCase;

  final f = DateFormat.yMd().add_jm();

  HomeBloc(
      this._getCurrentWeatherUserCase, this._getCurrentWeatherByLocationUseCase)
      : super(HomeInitState()) {
    on<GetWeatherByName>((event, emit) async {
      emit(WeatherLoading());
      final result = await _getCurrentWeatherUserCase(event.cityName);
      result.fold((failure) {
        emit(WeatherLoadFailure(failure.message));
      }, (data) {
        emit(filterData(data));
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));

    on<WeatherByLocation>((event, emit) async {
      emit(WeatherLoading());
      final result = await _getCurrentWeatherByLocationUseCase(
          CurrentLocationsParams(lat: event.lat, lon: event.lon));
      result.fold((failure) {
        emit(WeatherLoadFailure(failure.message));
      }, (data) {
        emit(filterData(data));
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  WeatherLoaded filterData(WeatherEntity data) {
    DateTime datetime = DateTime.fromMillisecondsSinceEpoch(data.dt * 1000);
    String dateTimeStr = f.format(datetime);

    DateTime sunsetDateTime =
        DateTime.fromMillisecondsSinceEpoch(data.sunset * 1000);
    DateTime sunriseDateTime =
        DateTime.fromMillisecondsSinceEpoch(data.sunrise * 1000);
    String sunsetStr = DateFormat.jm().format(sunsetDateTime);
    String sunriseStr = DateFormat.jm().format(sunriseDateTime);
    String visibility = (data.visibility / 1000).toString();
    return WeatherLoaded(
        data: data,
        dateTime: dateTimeStr,
        sunrise: sunriseStr,
        sunset: sunsetStr,
        visibility: visibility);
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
