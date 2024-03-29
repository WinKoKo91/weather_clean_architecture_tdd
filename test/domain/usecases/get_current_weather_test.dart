import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/domain/entities/weather_entity.dart';
import 'package:sunshine/domain/usecases/get_current_weather_by_name.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCurrentWeatherByNameUseCase getCurrentWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;
  final faker = Faker();
  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getCurrentWeatherUseCase =
        GetCurrentWeatherByNameUseCase(mockWeatherRepository);
  });

  String testCityName = faker.address.city();
  final fakeDateFormat = DateFormat('yyyy-MM-dd HH:mm:ss')
      .format(faker.date.dateTime(minYear: 2021, maxYear: 2022));
  final parsedDateTime = DateTime.parse(fakeDateFormat);
  final sunSetDateTime =
      DateTime.parse(fakeDateFormat).subtract(const Duration(hours: 8));
  final sunRiseDateTime = DateTime.parse(fakeDateFormat).add(const Duration(hours: 10));
  final dt = parsedDateTime.millisecondsSinceEpoch;
  final sunSet = sunSetDateTime.millisecondsSinceEpoch;
  final sunRise = sunRiseDateTime.millisecondsSinceEpoch;

  WeatherEntity testWeatherDetail = WeatherEntity(
    cityName: testCityName,
    main: faker.lorem.word(),
    description: faker.lorem.word(),
    iconCode: '02d',
    temperature: faker.randomGenerator.decimal(scale: 2),
    pressure: faker.randomGenerator.integer(9999, min: 1000),
    country: faker.address.countryCode(),
    lat: faker.geo.latitude(),
    lon: faker.geo.longitude(),
    humidity: faker.randomGenerator.integer(99, min: 10),
    sunset: sunSet,
    sunrise: sunRise,
    feelsLike: faker.randomGenerator.decimal(scale: 2),
    visibility: faker.randomGenerator.integer(9999, min: 1000),
    dt: dt,
  );

  test('should get current weather detail from the repository', () async {
    // arrange
    when(mockWeatherRepository.getCurrentWeather(testCityName))
        .thenAnswer((_) async => Right(testWeatherDetail));

    // act
    final result = await getCurrentWeatherUseCase(testCityName);

    // assert
    expect(result, Right(testWeatherDetail));
  });
}
