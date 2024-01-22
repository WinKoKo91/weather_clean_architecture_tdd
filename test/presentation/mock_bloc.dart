import 'package:bloc_test/bloc_test.dart';
import 'package:sunshine/presentation/home/bloc/air_pollution_bloc.dart';
import 'package:sunshine/presentation/home/bloc/air_pollution_event.dart';
import 'package:sunshine/presentation/home/bloc/air_pollution_state.dart';
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart';
import 'package:sunshine/presentation/home/bloc/forecast_event.dart';
import 'package:sunshine/presentation/home/bloc/forecast_state.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';
import 'package:sunshine/presentation/home/bloc/location_bloc.dart';
import 'package:sunshine/presentation/home/bloc/location_event.dart';
import 'package:sunshine/presentation/home/bloc/location_state.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class MockAirPollutionBloc
    extends MockBloc<AirPollutionEvent, AirPollutionState>
    implements AirPollutionBloc {}

class MockLocationBloc extends MockBloc<LocationEvent, LocationState>
    implements LocationBloc {}

class MockForecastBloc extends MockBloc<ForecastEvent, ForecastState>
    implements ForecastBloc {}
