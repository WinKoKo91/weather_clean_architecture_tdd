import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sunshine/data/model/weather_model.dart';
import 'package:sunshine/domain/entities/weather.dart';

import '../../helpers/json_reader.dart';

void main() {
  const testWeatherModel = WeatherModel(
      cityName: 'New York',
      main: 'Clear',
      description: 'clear sky',
      iconCode: '01n',
      temperature: 292.87,
      pressure: 1012,
      humidity: 70,
      dt: 1703998332,
      country: 'US');

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
          {
            'main': 'Clear',
            'description': 'clear sky',
            'icon': '01n',
          }
        ],
        'main': {
          'temp': 292.87,
          'pressure': 1012,
          'humidity': 70,
        },
        'sys':{
          'country' :'US'
        },
        'name': 'New York',
        'dt': 1703998332
      };

      expect(result, equals(expectedJsonMap));
    },
  );
}
