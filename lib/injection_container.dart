import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sunshine/data/repository/location_repository_impl.dart';
import 'package:sunshine/domain/usecases/search_location_by_city_name.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';

import 'data/datasource/location_remote_data_source.dart';
import 'data/datasource/weather_remote_data_source.dart';
import 'data/repository/weather_repository_impl.dart';
import 'domain/repositories/location_repository.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/get_current_weather.dart';

final locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator.registerFactory(() => HomeBloc( locator(),locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeatherUseCase(locator()));
  locator.registerLazySingleton(() => SearchLocationsByCityNameUseCase(locator()));

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
