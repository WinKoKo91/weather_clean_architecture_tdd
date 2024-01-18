import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/forecast_entity.dart';
import '../../../domain/usecases/get_five_day_forecast.dart';
import 'forecast_event.dart';
import 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final GetFiveDayForecastUseCase _getFiveDayForecastUseCase;
  final f = DateFormat('dd MMM');
  final weekdayFormatter = DateFormat.EEEE();

  ForecastBloc(this._getFiveDayForecastUseCase) : super(ForecastInitState()) {
    on<OnGetForecastEvent>((event, emit) async {
      emit(const ForecastLoadingState());

      final result = await _getFiveDayForecastUseCase
          .call(GetFiveDayForecastParams(event.lat, event.lon));

      try {
        result.fold((failure) {
          emit(ForecastFailState(failure.message));
        }, (data) {
          if (data.list.isEmpty) {
            return emit(ForecastLoadedState(list: data.list,code: data.code));
          }

          List<ForecastEntity> forecastList = [];
          ForecastEntity forecastEntity = data.list.first;
          DateTime datetime =
              DateTime.fromMillisecondsSinceEpoch(forecastEntity.dt * 1000);
          forecastEntity.date = f.format(datetime);
          forecastEntity.day = weekdayFormatter.format(datetime);
          forecastList.add(forecastEntity);

          for (var e in data.list) {
            int previousTimestamp = forecastList[forecastList.length - 1].dt;

            DateTime datetime =
                DateTime.fromMillisecondsSinceEpoch(e.dt * 1000);

            DateTime firstDatetime =
                DateTime.fromMillisecondsSinceEpoch(previousTimestamp * 1000);

            if (firstDatetime.weekday != datetime.weekday) {
              e.date = f.format(datetime);
              e.day = weekdayFormatter.format(datetime);
              forecastList.add(e);
            }
          }

          emit(ForecastLoadedState(list: forecastList.take(5).toList(),code: data.code));
        });
      } catch (e, stacktrace) {
        print(stacktrace);
        emit(ForecastFailState(e.toString()));
      }
    });
  }
}
