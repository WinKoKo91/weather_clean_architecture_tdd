import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:sunshine/data/model/air_pollution_model.dart';

import '../../core/constants.dart';
import '../../core/error/exception.dart';
import '../model/forecast_model.dart';
import '../model/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);

  Future<WeatherModel> getCurrentWeatherByLocation(  {required double lat, required double lon});

  Future<ForecastResponseModel> getFiveDayForecast(
      {required double lat, required double lon});

  Future<AirPollutionResponseModel> getAirPollution(
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
  Future<ForecastResponseModel> getFiveDayForecast(
      {required double lat, required double lon}) async {
    final response = await client
        .get(Uri.parse(Urls.getFiveDayForecast(lat: lat, lon: lon)));

    if (response.statusCode == 200) {
      logger.i(response.body);
      var result = json.decode(response.body);
      ForecastResponseModel fiveDayForecastModel =
          ForecastResponseModel.fromJson(result);

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

  @override
  Future<AirPollutionResponseModel> getAirPollution(
      {required double lat, required double lon}) async {
    final response =
        await client.get(Uri.parse(Urls.getAirPollution(lat: lat, lon: lon)));

    if (response.statusCode == 200) {
      logger.i(response.body);
      var result = json.decode(response.body);
      return AirPollutionResponseModel.fromJson(result);
    } else {
      logger.e(response.body, error: response);
      var result = json.decode(response.body);
      throw ServerException(message: result['message']);
    }
  }

  @override
  Future<WeatherModel> getCurrentWeatherByLocation({required double lat, required double lon}) async {
    final response =
        await client.get(Uri.parse(Urls.getCurrentWeatherByLocation(lat, lon)));

    if (response.statusCode == 200) {
      logger.i(response.body);
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      logger.e(response.body, error: response);
      var result = json.decode(response.body);
      throw ServerException(message: result['message']);
    }
  }
}
