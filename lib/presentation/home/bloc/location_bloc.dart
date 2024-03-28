import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:rxdart/transformers.dart';

import '../../../core/services/location_service.dart';
import '../../../domain/usecases/search_location_by_city_name.dart';
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

    on<GetCurrentLocation>((event, emit) async {
      emit(CurrentLocationLoading());
      try {
        bool permissionResult = await requestLocationPermission();
        if (permissionResult) {
          final location = await LocationService().getCurrentLocation();
          emit(CurrentLocationLoaded(
              location.latitude ?? 0.0, location.longitude ?? 0.0));
        } else {
          emit(const LocationFailState('Permission denied'));
        }
      } catch (e, stacktrace) {
        if (kDebugMode) {
          print(stacktrace);
        }
        emit(LocationFailState(e.toString()));
      }
    });
  }

  Future<bool> requestLocationPermission() async {
    const locationPermission = ph.Permission.location;

    final permissionStatus = await locationPermission.status;
    if (permissionStatus == ph.PermissionStatus.permanentlyDenied) {
      await ph.openAppSettings();
      return false;
    } else if (permissionStatus != ph.PermissionStatus.granted) {
      final status = await ph.Permission.location.request();
      return status == ph.PermissionStatus.granted;
    } else {
      return true;
    }
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
