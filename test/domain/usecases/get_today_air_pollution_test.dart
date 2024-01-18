import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/data/model/air_pollution_model.dart';
import 'package:sunshine/domain/entities/air_pollution_entity.dart';
import 'package:sunshine/domain/usecases/get_today_air_pollution.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTodayAirPollutionUseCase getTodayAirPollutionUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getTodayAirPollutionUseCase =
        GetTodayAirPollutionUseCase(mockWeatherRepository);
  });

  LocationParams testLocationParams = const LocationParams(16.79, 96.16);

  AirPollutionResponseEntity testAirPollutionResponseEntity =
      const AirPollutionResponseEntity(list: [
    AirPollutionModel(
      dt: 1705535196,
      aqi: 4,
      no2: 15.08,
      o3: 16.99,
      so2: 3.28,
      pm2_5: 51.96,
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
