import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sunshine/data/model/forecast_model.dart';

import '../../helpers/json_reader.dart';

void main() {
  ForecastResponseModel testFiveDayForecastModel =
      ForecastResponseModel(code: "200", list: [
        ForecastModel(
            iconCode: "02d",
            dt: 1704866400,
            temperature: 27.57,
            windDegree: 343,
            windSpeed: 1.97),
        ForecastModel(
            iconCode: "01d",
            dt: 1704963600,
            temperature: 30.0,
            windDegree: 318,
            windSpeed: 1.64),
        ForecastModel(
            iconCode: "01n",
            dt: 1705050000,
            temperature: 25.87,
            windDegree: 272,
            windSpeed: 1.37),
        ForecastModel(
            iconCode: "01n",
            dt: 1705136400,
            temperature: 23.51,
            windDegree: 280,
            windSpeed: 1.32),
        ForecastModel(
            iconCode: "01n",
            dt: 1705222800,
            temperature: 21.96,
            windDegree: 300,
            windSpeed: 2.8)
  ]);

  test('should be a subclass of forecast entity', () async {
    expect(testFiveDayForecastModel, isA<ForecastResponseModel>());
  });

  test('should return a valid model from json', () async {
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('helpers/dummy_data/dummy_forecast_model.json'));
    final result = ForecastResponseModel.fromJson(jsonMap);
    expect(result, testFiveDayForecastModel);
  });

  test('should return a json map containing proper data', () {
    //arrange
    final expectedJsonMap = <String, dynamic>{
      'cod': '200',
      'list': [
        {
          'weather': [
            {'icon': '02d'}
          ],
          'main': {'temp': 27.57},
          'dt': 1704866400,
          "wind": {
            "speed": 1.97,
            "deg": 343,
          },
        },
        {
          'weather': [
            {'icon': '01d'}
          ],
          "wind": {
            "speed": 1.64,
            "deg": 318,
          },
          'main': {'temp': 30.00},
          'dt': 1704963600
        },
        {
          'weather': [
            {'icon': '01n'}
          ],
          "wind": {
            "speed": 1.37,
            "deg": 272,
          },
          'main': {'temp': 25.87},
          'dt': 1705050000
        },
        {
          'weather': [
            {'icon': '01n'}
          ],
          "wind": {
            "speed": 1.32,
            "deg": 280,
          },
          'main': {'temp': 23.51},
          'dt': 1705136400
        },
        {
          'weather': [
            {'icon': '01n'}
          ],
          "wind": {
            "speed": 2.8,
            "deg": 300,
          },
          'main': {'temp': 21.96},
          'dt': 1705222800
        }
      ]
    };

    //act
    final result = testFiveDayForecastModel.toJson();

    //expect
    expect(result, equals(expectedJsonMap));
  });
}
