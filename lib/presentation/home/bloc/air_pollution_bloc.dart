import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sunshine/domain/usecases/get_today_air_pollution.dart';

import '../../../domain/entities/air_pollution_entity.dart';
import 'air_pollution_event.dart';
import 'air_pollution_state.dart';

class AirPollutionBloc extends Bloc<AirPollutionEvent, AirPollutionState> {
  final GetTodayAirPollutionUseCase _getTodayAirPollutionUseCase;

  AirPollutionBloc(this._getTodayAirPollutionUseCase)
      : super(AirPollutionInitState()) {
    on<OnGetAirPollutionEvent>((event, emit) async {
      emit(const AirPollutionLoadingState());

      final result = await _getTodayAirPollutionUseCase(
          LocationParams(event.lat, event.lon));

      try {
        result.fold((failure) {
          emit(AirPollutionFailState(failure.message));
        }, (data) {
          if (data.list.isEmpty) {
            return emit(const AirPollutionFailState('No Data'));
          }

          AirPollutionEntity airPollutionEntity = data.list.first;
          String qualitativeName;
          Color qualitativeColor;
          switch (airPollutionEntity.aqi) {
            case 1:
              qualitativeName = 'Good';
              qualitativeColor = Colors.green;
              break;
            case 2:
              qualitativeName = 'Fair';
              qualitativeColor = Colors.lightGreen;
              break;
            case 3:
              qualitativeName = 'Moderate';
              qualitativeColor = Colors.yellow;
              break;
            case 4:
              qualitativeName = 'Poor';
              qualitativeColor = Colors.orange;
              break;
            case 5:
              qualitativeName = 'Very Poor';
              qualitativeColor = Colors.red;
              break;
            default:
              qualitativeName = 'Good';
              qualitativeColor = Colors.green;
          }
          emit(AirPollutionLoadedState(data: airPollutionEntity, qualitativeName:  qualitativeName, qualitativeColor: qualitativeColor));
        });
      } catch (e, stacktrace) {
        print(stacktrace);
        emit(AirPollutionFailState(e.toString()));
      }
    });
  }
}
