import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:sunshine/data/datasource/remote_data_source.dart';
import 'package:sunshine/domain/repositories/weather_repository.dart';
import 'package:sunshine/domain/usecases/get_current_weather.dart';
import 'package:sunshine/presentation/weather/bloc/weather_bloc.dart';

@GenerateMocks([WeatherRepository, WeatherRemoteDataSource, GetCurrentWeatherUseCase, WeatherBloc], customMocks:[MockSpec<http.Client> (as: #MockHttpClient)],)

void main(){}