import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/data/model/forecast_model.dart';
import 'package:sunshine/domain/entities/forecast_entity.dart';
import 'package:sunshine/domain/usecases/get_five_day_forecast.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetFiveDayForecastUseCase getFiveDayForecastUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getFiveDayForecastUseCase =
        GetFiveDayForecastUseCase(mockWeatherRepository);
  });

  double testLat = 16.7967129;
  double testLon = 96.1609916;

  ForecastResponseEntity testFiveDayForecastEntity =
      ForecastResponseEntity(code: "200", list: [
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

  test('should get five day forecast from the repository', () async {
    // arrange
    when(mockWeatherRepository.getFiveDayForecast(lat: testLat, lon: testLon))
        .thenAnswer((_) async => Right(testFiveDayForecastEntity));

    // act
    final result = await getFiveDayForecastUseCase(
        GetFiveDayForecastParams(testLat, testLon));

    // assert
    expect(result, Right(testFiveDayForecastEntity));
  });
}
