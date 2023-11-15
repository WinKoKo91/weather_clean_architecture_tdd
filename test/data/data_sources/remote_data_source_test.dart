import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:sunshine/core/constants.dart';
import 'package:sunshine/core/error/exception.dart';
import 'package:sunshine/data/datasource/remote_data_source.dart';
import 'package:sunshine/data/model/weather_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl =
        WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });

  const testCityName = "New York";

  group('get current weather', () {
    test('should return weather model when the response code is 200', () async {
      //arrange
      when(
        mockHttpClient.get(
          Uri.parse(
            Urls.currentWeatherByName(testCityName),
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(
            readJson('helpers/dummy_data/dummy_weather_response.json'), 200),
      );

      //act
      final result =
          await weatherRemoteDataSourceImpl.getCurrentWeather(testCityName);

      // assert
      expect(result, isA<WeatherModel>());
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () async {
      //arrange
      try {
        when(mockHttpClient
                .get(Uri.parse(Urls.currentWeatherByName(testCityName))))
            .thenAnswer((_) async => http.Response(
                  "{\"cod\":\"404\",\"message\":\"city not found\"}",
                  404,
                ));
        //act
        await weatherRemoteDataSourceImpl.getCurrentWeather(testCityName);

      } catch (e) {
        // assert
        expect(e, isA<ServerException>());
      }
    });
  });
}
