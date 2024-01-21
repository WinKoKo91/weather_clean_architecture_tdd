import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:sunshine/core/constants.dart';
import 'package:sunshine/core/error/exception.dart';
import 'package:sunshine/data/datasource/weather_remote_data_source.dart';
import 'package:sunshine/data/model/air_pollution_model.dart';
import 'package:sunshine/data/model/forecast_model.dart';
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
            Urls.getCurrentWeatherByName(testCityName),
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
                .get(Uri.parse(Urls.getCurrentWeatherByName(testCityName))))
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

  double lat = 16.7967129;
  double lon = 96.1609916;

  group('get five day forecast', () {
    test('should return 5 day forecast model when the response code is 200',
        () async {
      //arrange
      when(
        mockHttpClient.get(
          Uri.parse(
            Urls.getFiveDayForecast(lat: lat, lon: lon),
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(
            readJson('helpers/dummy_data/dummy_forecast_model.json'),
            200),
      );

      //act
      final result = await weatherRemoteDataSourceImpl.getFiveDayForecast(
          lat: lat, lon: lon);

      // assert
      expect(result, isA<ForecastResponseModel>());
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () async {
      //arrange
      try {
        when(mockHttpClient.get(Uri.parse(
          Urls.getFiveDayForecast(lat: lat, lon: lon),
        ))).thenAnswer((_) async => http.Response(
              "{\"cod\":\"404\",\"message\":\"city not found\"}",
              404,
            ));
        //act
        await weatherRemoteDataSourceImpl.getFiveDayForecast(
            lat: lat, lon: lon);
      } catch (e) {
        // assert
        expect(e, isA<ServerException>());
      }
    });
  });


  group('get air pollution', () {
    test('should return air pollution model when the response code is 200',
            () async {
          //arrange
          when(
            mockHttpClient.get(
              Uri.parse(
                Urls.getAirPollution(lat: lat, lon: lon),
              ),
            ),
          ).thenAnswer(
                (_) async => http.Response(
                readJson('helpers/dummy_data/dummy_air_pollution_model.json'),
                200),
          );

          //act
          final result = await weatherRemoteDataSourceImpl.getAirPollution(
              lat: lat, lon: lon);

          // assert
          expect(result, isA<AirPollutionResponseModel>());
        });

    test(
        'should throw a server exception when the response code is 404 or other',
            () async {
          //arrange
          try {
            when(mockHttpClient.get(Uri.parse(
              Urls.getFiveDayForecast(lat: lat, lon: lon),
            ))).thenAnswer((_) async => http.Response(
              "{\"cod\":\"404\",\"message\":\"city not found\"}",
              404,
            ));
            //act
            await weatherRemoteDataSourceImpl.getFiveDayForecast(
                lat: lat, lon: lon);
          } catch (e) {
            // assert
            expect(e, isA<ServerException>());
          }
        });
  });
}
