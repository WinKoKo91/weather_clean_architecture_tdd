import 'package:connectivity_plus/connectivity_plus.dart';
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

import 'data/datasource/local/weather_local_data_source.dart';
import 'data/datasource/remote/location_remote_data_source.dart';
import 'data/datasource/remote/weather_remote_data_source.dart';
import 'data/repository/weather_repository_impl.dart';
import 'domain/repositories/location_repository.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/get_current_weather_by_location.dart';
import 'domain/usecases/get_current_weather_by_name.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
        weatherRemoteDataSource: locator(),
        weatherLocalDataSource: locator(),
        isOnline: () async {
          ConnectivityResult result = await Connectivity().checkConnectivity();
          return result != ConnectivityResult.none;
        }),
  );
  locator.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(locationDataSource: locator()),
  );

  // data source
  locator.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImpl(),
  );

  locator.registerLazySingleton<LocationRemoteDataSource>(
    () => LocationRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // useCase
  locator
      .registerLazySingleton(() => GetCurrentWeatherByNameUseCase(locator()));
  locator.registerLazySingleton(
      () => GetCurrentWeatherByLocationUseCase(locator()));
  locator
      .registerLazySingleton(() => SearchLocationsByCityNameUseCase(locator()));
  locator.registerLazySingleton(() => GetFiveDayForecastUseCase(locator()));
  locator.registerLazySingleton(() => GetTodayAirPollutionUseCase(locator()));

  // external
  locator.registerLazySingleton(() => http.Client());

  await locator<WeatherLocalDataSource>().initDb();

  // bloc
  locator.registerFactory(() => HomeBloc(locator(), locator()));
  locator.registerFactory(() => ForecastBloc(locator()));
  locator.registerFactory(() => AirPollutionBloc(locator()));
  locator.registerFactory(() => LocationBloc(locator()));
}
