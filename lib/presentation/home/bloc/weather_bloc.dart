import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sunshine/presentation/home/bloc/weather_event.dart';
import 'package:sunshine/presentation/home/bloc/weather_state.dart';

import '../../../domain/usecases/get_current_weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUserCase;
  final f = DateFormat.yMd().add_jm();

  WeatherBloc(this._getCurrentWeatherUserCase) : super(WeatherEmpty()) {
    on<OnCityChanged>((event, emit) async {
      emit(WeatherLoading());
      final result = await _getCurrentWeatherUserCase.execute(event.cityName);
      result.fold((failure) {
        emit(WeatherLoadFailure(failure.message));
      }, (data) {
        DateTime datetime = DateTime.fromMillisecondsSinceEpoch(data.dt * 1000);
        String dateTimeStr = f.format(datetime);

        emit(WeatherLoaded(data, dateTimeStr));
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
