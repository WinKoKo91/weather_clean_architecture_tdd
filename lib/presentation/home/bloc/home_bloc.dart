import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/transformers.dart';

import '../../../domain/usecases/get_current_weather.dart';
import '../../../domain/usecases/search_location_by_city_name.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SearchLocationsByCityNameUseCase _searchLocationsByCityNameUseCase;
  final GetCurrentWeatherUseCase _getCurrentWeatherUserCase;

  final f = DateFormat.yMd().add_jm();

  HomeBloc(
      this._getCurrentWeatherUserCase, this._searchLocationsByCityNameUseCase)
      : super(HomeInitState()) {

    on<OnCitySubmit>((event, emit) async {
      emit(LocationSearchingState());
      final result = await _searchLocationsByCityNameUseCase
          .call(SearchLocationsParams(event.cityName));
      result.fold((failure) {
        emit(HomeFailState(failure.message));
      }, (data) {
        emit(LocationSearchSuccessState(data));
      });
    });

    on<OnCityChanged>((event, emit) async {
      emit(WeatherLoading());
      final result = await _getCurrentWeatherUserCase.execute(event.cityName);
      result.fold((failure) {
        emit(WeatherLoadFailure(failure.message));
      }, (data) {
        DateTime datetime = DateTime.fromMillisecondsSinceEpoch(data.dt * 1000);
        String dateTimeStr = f.format(datetime);

        DateTime sunsetDateTime = DateTime.fromMillisecondsSinceEpoch(data.sunset * 1000);
        DateTime sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(data.sunrise * 1000);
        String sunsetStr =  DateFormat.jm().format(sunsetDateTime);
        String sunriseStr =  DateFormat.jm().format(sunriseDateTime);

        emit(WeatherLoaded(data, dateTimeStr, sunriseStr, sunsetStr));
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}


EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}