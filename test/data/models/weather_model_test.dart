import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sunshine/data/model/weather_model.dart';
import 'package:sunshine/domain/entities/weather.dart';

import '../../helpers/json_reader.dart';

void main() {
  const testWeatherModel = WeatherModel(
      cityName: 'Yangon',
      main: 'Clouds',
      description: 'few clouds',
      iconCode: '02d',
      temperature: 30.03,
      pressure: 1013,
      humidity: 58,
      lat: 16.7967,
      lon: 96.161,
      dt: 1705382769,
      sunset: 1705404094,
      sunrise: 1705363655,
      feelsLike: 32.5,
      visibility: 8000,
      country: 'MM');

  test('should be a subclass of weather entity', () async {
    //assert
    expect(testWeatherModel, isA<WeatherEntity>());
  });

  test('should return a valid model from json', () async {
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_weather_response.json'),
    );

    final result = WeatherModel.fromJson(jsonMap);
    expect(result, equals(testWeatherModel));
  });

  test(
    'should return a json map containing proper data',
    () async {
      // act
      final result = testWeatherModel.toJson();

      // assert
      final expectedJsonMap = {
        'weather': [
          {"main": "Clouds", "description": "few clouds", "icon": "02d"}
        ],
        'main': {"temp": 30.03, "pressure": 1013, "humidity": 58,'feels_like': 32.5},
        'sys': {'country': 'MM','sunrise': 1705363655, 'sunset': 1705404094},
        "coord": {"lon": 96.161, "lat": 16.7967},
        'name': 'Yangon',
        'visibility': 8000,
        'dt': 1705382769
      };

      expect(result, equals(expectedJsonMap));
    },
  );
}
