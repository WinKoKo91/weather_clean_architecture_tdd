import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sunshine/data/repository/location_repository_impl.dart';
import 'package:sunshine/domain/usecases/get_five_day_forecast.dart';
import 'package:sunshine/domain/usecases/get_today_air_pollution.dart';
import 'package:sunshine/domain/usecases/search_location_by_city_name.dart';
import 'package:sunshine/presentation/home/bloc/air_pollution_bloc.dart';
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/location_bloc.dart';

import 'data/datasource/location_remote_data_source.dart';
import 'data/datasource/weather_remote_data_source.dart';
import 'data/repository/weather_repository_impl.dart';
import 'domain/repositories/location_repository.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/get_current_weather.dart';

final locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator.registerFactory(() => HomeBloc( locator()));
  locator.registerFactory(() => ForecastBloc( locator()));
  locator.registerFactory(() => AirPollutionBloc( locator()));
  locator.registerFactory(() => LocationBloc( locator()));

  // useCase
  locator.registerLazySingleton(() => GetCurrentWeatherUseCase(locator()));
  locator.registerLazySingleton(() => SearchLocationsByCityNameUseCase(locator()));
  locator.registerLazySingleton(() => GetFiveDayForecastUseCase(locator()));
  locator.registerLazySingleton(() => GetTodayAirPollutionUseCase(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(weatherRemoteDataSource: locator()),
  );
  locator.registerLazySingleton<LocationRepository>(
        () => LocationRepositoryImpl(locationRemoteDataSource: locator()),
  );

  // data source
  locator.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton<LocationRemoteDataSource>(
        () => LocationRemoteDataSourceImpl(
      client: locator(),
    ),
  );


  // external
  locator.registerLazySingleton(() => http.Client());
}
