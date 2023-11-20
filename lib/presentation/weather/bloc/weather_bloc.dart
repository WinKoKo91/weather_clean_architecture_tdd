import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sunshine/presentation/weather/bloc/weather_event.dart';
import 'package:sunshine/presentation/weather/bloc/weather_state.dart';

import '../../../domain/usecases/get_current_weather.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUserCase;

  WeatherBloc(this._getCurrentWeatherUserCase) : super(WeatherEmpty()) {
    on<OnCityChanged>((event, emit) async {
      emit(WeatherLoading());
      final result = await _getCurrentWeatherUserCase.execute(event.cityName);
      result.fold((failure) {
        emit(WeatherLoadFailure(failure.message));
      }, (data) {
        emit(WeatherLoaded(data));
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
