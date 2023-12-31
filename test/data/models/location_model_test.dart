import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sunshine/data/model/location_model.dart';
import 'package:sunshine/domain/entities/location.dart';

import '../../helpers/json_reader.dart';

// Test  arrange, act, expect
void main() {
  // arrange
  const testLocationModel =  LocationModel(
    name: 'Yangon',
    lat: 16.7967129,
    lon: 96.1609916,
    country: 'MM',
    state: 'Yangon',
  );

  test('should be a subclass of location entity', () async {
    // expect
    expect(testLocationModel, isA<LocationEntity>());
  });

  test('should return a valid model from json', () async {
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('helpers/dummy_data/dummy_location.json'));

    final result = LocationModel.fromJson(jsonMap);
    expect(result, testLocationModel);
  });

  test('should return a json map containing proper data', () async {
    //arrange
    final expectedJsonMap = {
      "name": "Yangon",
      "lat": 16.7967129,
      "lon": 96.1609916,
      "country": "MM",
      "state": "Yangon"
    };

    //act
    final result = testLocationModel.toJson();

    //expect
    expect(result, equals(expectedJsonMap));
  });
}
