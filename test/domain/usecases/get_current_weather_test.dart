import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/domain/entities/weather.dart';
import 'package:sunshine/domain/usecases/get_current_weather_by_name.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCurrentWeatherByNameUseCase getCurrentWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getCurrentWeatherUseCase = GetCurrentWeatherByNameUseCase(mockWeatherRepository);
  });

  String testCityName = 'Yangon';

  const WeatherEntity testWeatherDetail = WeatherEntity(
      cityName: "Yangon",
      main: 'Coluds',
      description: 'few clouds',
      iconCode: '02d',
      temperature: 302.28,
      pressure: 1009,
      country: 'MM',
      lat: 16.7993,
      lon: 96.1583,
      humidity: 70,
      sunset: 1705404094,
      sunrise: 1705363655,
      feelsLike: 32.5,
      visibility: 8000,
  dt: 1703998332);

  test('should get current weather detail from the repository', () async {
    // arrange
    when(mockWeatherRepository.getCurrentWeather(testCityName))
        .thenAnswer((_) async => const Right(testWeatherDetail));

    // act
    final result = await getCurrentWeatherUseCase(testCityName);

    // assert
    expect(result,const Right(testWeatherDetail));
  });
}
