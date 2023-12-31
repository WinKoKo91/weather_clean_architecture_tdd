import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';

import '../../../domain/usecases/get_current_weather.dart';
import '../../../domain/usecases/search_location_by_city_name.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUserCase;
  final SearchLocationsByCityNameUseCase _searchLocationsByCityNameUseCase;



  HomeBloc(
      this._getCurrentWeatherUserCase, this._searchLocationsByCityNameUseCase)
      : super(HomeInitState()) {
    on<OnCitySubmit>((event, emit) async {
      emit(const HomeCitySearchState());
      final result = await _searchLocationsByCityNameUseCase
          .call(SearchLocationsParams(event.cityName));
      result.fold((failure) {
        emit(HomeFailState(failure.message));
      }, (data) {
        emit(HomeSearchCityResult(data));
      });
    });
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    try {
      return double.parse(s) != null;
    } catch (e) {
      return false;
    }
  }
}
