import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/data/model/forecast_model.dart';
import 'package:sunshine/domain/entities/forecast_entity.dart';
import 'package:sunshine/domain/usecases/get_five_day_forecast.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetFiveDayForecastUseCase getFiveDayForecastUseCase;
  late MockWeatherRepository mockWeatherRepository;
  final faker = Faker();


  ForecastModel generateForecastModel() {
    final fakeDateFormat = DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(faker.date.dateTime(minYear: 2021, maxYear: 2024));
    final parsedDateTime = DateTime.parse(fakeDateFormat);
    final dt = parsedDateTime.millisecondsSinceEpoch;
    return ForecastModel(
      iconCode: "01n",
      dt: dt,
      temperature: faker.randomGenerator.decimal(scale: 2),
      windDegree: faker.randomGenerator.integer(999, min: 0),
      windSpeed: faker.randomGenerator.decimal(scale: 2),
    );
  }

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getFiveDayForecastUseCase =
        GetFiveDayForecastUseCase(mockWeatherRepository);
  });

  double testLat = 16.7967129;
  double testLon = 96.1609916;

  ForecastResponseEntity testFiveDayForecastEntity =
      ForecastResponseEntity(code: "200", list: [
        generateForecastModel(),
        generateForecastModel(),
        generateForecastModel(),
        generateForecastModel(),
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
