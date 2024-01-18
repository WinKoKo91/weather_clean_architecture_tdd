import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sunshine/data/model/five_day_forecast_model.dart';
import 'package:sunshine/data/model/forecast_model.dart';

import '../../helpers/json_reader.dart';

void main() {
  FiveDayForecastModel testFiveDayForecastModel =
       FiveDayForecastModel(code: "200", list: [
    ForecastModel(iconCode: "02d", dt: 1704866400, temperature: 27.57),
    ForecastModel(iconCode: "01d", dt: 1704877200, temperature: 30.0),
    ForecastModel(iconCode: "01n", dt: 1704888000, temperature: 25.87),
    ForecastModel(iconCode: "01n", dt: 1704898800, temperature: 23.51),
    ForecastModel(iconCode: "01n", dt: 1704909600, temperature: 21.96)
  ]);

  test('should be a subclass of forecast entity', () async {
    expect(testFiveDayForecastModel, isA<FiveDayForecastModel>());
  });

  test('should return a valid model from json', () async {
    final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dummy_data/dummy_five_day_forecast_model.json'));
    final result = FiveDayForecastModel.fromJson(jsonMap);
    expect(result, testFiveDayForecastModel);
  });

  test('should return a json map containing proper data', () {
    //arrange
    final expectedJsonMap =  <String, dynamic> {
      'cod': '200',
      'list': [
        {'weather': [{'icon': '02d'}], 'main': {'temp': 27.57}, 'dt': 1704866400},
        {'weather': [{'icon': '01d'}], 'main': {'temp': 30.00}, 'dt': 1704877200},
        {'weather': [{'icon': '01n'}], 'main': {'temp': 25.87}, 'dt': 1704888000},
        {'weather': [{'icon': '01n'}], 'main': {'temp': 23.51}, 'dt': 1704898800},
        {'weather': [{'icon': '01n'}], 'main': {'temp': 21.96}, 'dt': 1704909600}
      ]
    };

    //act
    final result = testFiveDayForecastModel.toJson();

    //expect
    expect(result, equals(expectedJsonMap));
  });
}
