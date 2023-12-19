import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';

import '../../../domain/usecases/get_current_weather.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUserCase;

  HomeBloc(this._getCurrentWeatherUserCase) : super(HomeInitState()) {
    on<OnCitySubmit>((event, emit) async {
      emit(HomeLoadingState());
      if (event.cityName != null && event.cityName.isNotEmpty) {
        emit(HomeSuccessState(event.cityName));
      } else {
        emit(const HomeFailState('Please enter valid city name'));
      }
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
