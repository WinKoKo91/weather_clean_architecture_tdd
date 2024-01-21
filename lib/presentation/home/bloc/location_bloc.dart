import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/transformers.dart';

import '../../../domain/usecases/get_current_weather.dart';
import '../../../domain/usecases/search_location_by_city_name.dart';
import 'home_event.dart';
import 'home_state.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final SearchLocationsByCityNameUseCase _searchLocationsByCityNameUseCase;

  final f = DateFormat.yMd().add_jm();

  LocationBloc(this._searchLocationsByCityNameUseCase)
      : super(LocationInitState()) {
    on<OnCitySubmit>((event, emit) async {
      emit(LocationSearchingState());
      final result = await _searchLocationsByCityNameUseCase
          .call(SearchLocationsParams(event.cityName));
      result.fold((failure) {
        emit(LocationFailState(failure.message));
      }, (data) {
        emit(LocationSearchSuccessState(data));
      });
    });
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
