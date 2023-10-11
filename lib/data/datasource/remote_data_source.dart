import 'dart:convert';


import 'package:logger/logger.dart';

import '../../core/constants.dart';
import '../../core/error/exception.dart';
import '../model/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final http.Client client;
  var logger = Logger(printer: PrettyPrinter(),);
  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      logger.i(response.body);
      return WeatherModel.fromJson(json.decode(response.body));
    }else{

      logger.e(response.body,error: response);

      throw ServerException();
    }
  }
}
