import 'package:mockito/annotations.dart';
import 'package:weather_clean_architecture_tdd/data/datasource/remote_data_source.dart';
import 'package:weather_clean_architecture_tdd/domain/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weather_clean_architecture_tdd/domain/usecases/get_current_weather.dart';
import 'package:weather_clean_architecture_tdd/presentation/bloc/weather_bloc.dart';

@GenerateMocks([WeatherRepository, WeatherRemoteDataSource, GetCurrentWeatherUseCase, WeatherBloc], customMocks:[MockSpec<http.Client> (as: #MockHttpClient)],)

void main(){}