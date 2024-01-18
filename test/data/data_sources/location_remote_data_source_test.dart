import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:sunshine/core/constants.dart';
import 'package:sunshine/core/error/exception.dart';
import 'package:sunshine/data/datasource/location_remote_data_source.dart';
import 'package:sunshine/data/model/location_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late LocationRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl =
        LocationRemoteDataSourceImpl(client: mockHttpClient);
  });

  const testCityName = "New York";

  group('get city list', () {
    test('should return location model list when response code is 200',
        () async {
      //arrange
      when(
        mockHttpClient.get(
          Uri.parse(
            Urls.searchCityListByName(testCityName),
          ),
        ),
      ).thenAnswer((_) async => http.Response(
              readJson('helpers/dummy_data/dummy_location_response.json'), 200,
              headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }));

      // act
      final result =
          await weatherRemoteDataSourceImpl.searchCityListByName(testCityName);

      //assert
      expect(result, isA<List<LocationModel>>());
    });
    test(
        'should throw a server exception when the response code is 404 or other',
            () async {
          //arrange
          try {
            when(mockHttpClient
                .get(Uri.parse(Urls.searchCityListByName(testCityName))))
                .thenAnswer((_) async => http.Response(
              "{\"cod\":\"404\",\"message\":\"city not found\"}",
              404,
            ));
            //act
            await weatherRemoteDataSourceImpl.searchCityListByName(testCityName);
          } catch (e) {
            // assert
            expect(e, isA<ServerException>());
          }
        });
  });

}
