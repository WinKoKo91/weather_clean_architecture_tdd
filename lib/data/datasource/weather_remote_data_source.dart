import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:sunshine/data/model/location_model.dart';

import '../../core/constants.dart';
import '../../core/error/exception.dart';
import '../model/five_day_forecast_model.dart';
import '../model/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);

  Future<FiveDayForecastModel> getFiveDayForecast(
      {required double lat, required double lon});
}


class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final http.Client client;
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.getCurrentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      logger.i(response.body);
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      logger.e(response.body, error: response);
      var result = json.decode(response.body);
      throw ServerException(message: result['message']);
    }
  }

  @override
  Future<FiveDayForecastModel> getFiveDayForecast(
      {required double lat, required double lon}) async {
    final response = await client
        .get(Uri.parse(Urls.getFiveDayForecast(lat: lat, lon: lon)));

    if (response.statusCode == 200) {
      logger.i(response.body);
      var result = json.decode(response.body);
      FiveDayForecastModel fiveDayForecastModel =
          FiveDayForecastModel.fromJson(result);

      if (fiveDayForecastModel.code == '200') {
        return fiveDayForecastModel;
      } else {
        throw ServerException(message: 'Something was wrong!');
      }
    } else {
      logger.e(response.body, error: response);
      var result = json.decode(response.body);
      throw ServerException(message: result['message']);
    }
  }
}
