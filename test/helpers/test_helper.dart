import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:sunshine/data/datasource/location_remote_data_source.dart';
import 'package:sunshine/data/datasource/weather_remote_data_source.dart';
import 'package:sunshine/domain/repositories/location_repository.dart';
import 'package:sunshine/domain/repositories/weather_repository.dart';
import 'package:sunshine/domain/usecases/get_current_weather_by_location.dart';
import 'package:sunshine/domain/usecases/get_current_weather_by_name.dart';
import 'package:sunshine/domain/usecases/get_five_day_forecast.dart';
import 'package:sunshine/domain/usecases/get_today_air_pollution.dart';
import 'package:sunshine/domain/usecases/search_location_by_city_name.dart';
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/location_bloc.dart';

@GenerateMocks(
  [
    WeatherRepository,
    WeatherRemoteDataSource,
    GetCurrentWeatherByNameUseCase,
    GetCurrentWeatherByLocationUseCase,
    GetFiveDayForecastUseCase,
    SearchLocationsByCityNameUseCase,
    GetTodayAirPollutionUseCase,
    HomeBloc,
    ForecastBloc,
    LocationBloc,
    LocationRepository,
    LocationRemoteDataSource
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
