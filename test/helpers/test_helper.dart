import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:sunshine/data/datasource/location_remote_data_source.dart';
import 'package:sunshine/data/datasource/weather_remote_data_source.dart';
import 'package:sunshine/domain/repositories/location_repository.dart';
import 'package:sunshine/domain/repositories/weather_repository.dart';
import 'package:sunshine/domain/usecases/get_current_weather.dart';
import 'package:sunshine/domain/usecases/search_location_by_city_name.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';

@GenerateMocks([WeatherRepository, WeatherRemoteDataSource, GetCurrentWeatherUseCase, SearchLocationsByCityNameUseCase,HomeBloc,
  LocationRepository, LocationRemoteDataSource], customMocks:[MockSpec<http.Client> (as: #MockHttpClient)],)
void main(){}