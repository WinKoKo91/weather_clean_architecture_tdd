import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sunshine/data/model/air_pollution_model.dart';
import 'package:sunshine/domain/entities/air_pollution_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  AirPollutionResponseModel testAirPollutionResponseModel =
      const AirPollutionResponseModel(
    list: [
      AirPollutionModel(
        dt: 1705535196,
        aqi: 4,
        no2: 15.08,
        o3: 16.99,
        so2: 3.28,
        pm2_5: 51.96,
      ),
    ],
  );

  test('should be a subclass of air pollution entity', () async {
    expect(testAirPollutionResponseModel, isA<AirPollutionResponseEntity>());
  });

  test('should return a valid model from json', () async {
    final Map<String, dynamic> jsonMap = json
        .decode(readJson('helpers/dummy_data/dummy_air_pollution_model.json'));
    final result = AirPollutionResponseModel.fromJson(jsonMap);
    expect(result, testAirPollutionResponseModel);
  });

  test('should return a json map containing proper data', () {
    //arrange
    final expectedJsonMap = <String, dynamic>{
      'list': [
        {
          "main": {"aqi": 4},
          "components": {
            "no2": 15.08,
            "o3": 16.99,
            "so2": 3.28,
            "pm2_5": 51.96,
          },
          "dt": 1705535196
        }
      ]
    };

    //act
    final result = testAirPollutionResponseModel.toJson();

    //expect
    expect(result, equals(expectedJsonMap));
  });
}
