import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/data/model/air_pollution_model.dart';
import 'package:sunshine/domain/entities/air_pollution_entity.dart';
import 'package:sunshine/domain/usecases/get_today_air_pollution.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTodayAirPollutionUseCase getTodayAirPollutionUseCase;
  late MockWeatherRepository mockWeatherRepository;
  final faker = Faker();
  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getTodayAirPollutionUseCase =
        GetTodayAirPollutionUseCase(mockWeatherRepository);
  });

  LocationParams testLocationParams = const LocationParams(16.79, 96.16);

  final fakeDateFormat = DateFormat('yyyy-MM-dd HH:mm:ss')
      .format(faker.date.dateTime(minYear: 2021, maxYear: 2024));
  final parsedDateTime = DateTime.parse(fakeDateFormat);
  final dt = parsedDateTime.millisecondsSinceEpoch;

  AirPollutionResponseEntity testAirPollutionResponseEntity =
      AirPollutionResponseEntity(list: [
    AirPollutionModel(
      dt: dt,
      aqi: faker.randomGenerator.integer(4),
      no2: faker.randomGenerator.decimal(scale: 2),
      o3: faker.randomGenerator.decimal(scale: 2),
      so2: faker.randomGenerator.decimal(scale: 2),
      pm2_5: faker.randomGenerator.decimal(scale: 2),
    ),
  ]);

  test('should get five day air pollution from the repository', () async {
    // arrange
    when(mockWeatherRepository.getAirPollution(
            lat: testLocationParams.lat, lon: testLocationParams.lon))
        .thenAnswer((_) async => Right(testAirPollutionResponseEntity));

    // act
    final result = await getTodayAirPollutionUseCase(testLocationParams);

    // assert
    expect(result, Right(testAirPollutionResponseEntity));
  });
}
