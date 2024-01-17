import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/core/usecase/usecase.dart';
import 'package:sunshine/core/utils/typedef.dart';
import 'package:sunshine/data/model/five_day_forecast_model.dart';
import 'package:sunshine/data/model/forecast_model.dart';
import 'package:sunshine/domain/entities/five_day_forecast_entity.dart';
import 'package:sunshine/domain/usecases/get_five_day_forecast.dart';

import '../../helpers/test_helper.mocks.dart';


void main(){

  late GetFiveDayForecastUseCase getFiveDayForecastUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp((){
    mockWeatherRepository = MockWeatherRepository();
    getFiveDayForecastUseCase =GetFiveDayForecastUseCase(mockWeatherRepository);
  });

  double testLat = 16.7967129;
  double testLon = 96.1609916;


  FiveDayForecastEntity testFiveDayForecastEntity =
  FiveDayForecastEntity(code: "200", list: [
    ForecastModel(iconCode: "02d", dt: 1704866400, temperature: 27.57),
    ForecastModel(iconCode: "01d", dt: 1704877200, temperature: 30.0),
    ForecastModel(iconCode: "01n", dt: 1704888000, temperature: 25.87),
    ForecastModel(iconCode: "01n", dt: 1704898800, temperature: 23.51),
    ForecastModel(iconCode: "01n", dt: 1704909600, temperature: 21.96)
  ]);


  test('should get five day forecast from the repository', () async {
    // arrange
    when(mockWeatherRepository.getFiveDayForecast(lat: testLat, lon: testLon))
        .thenAnswer((_) async =>  Right(testFiveDayForecastEntity));

    // act
    final result = await getFiveDayForecastUseCase.execute(testLat, testLon);

    // assert
    expect(result, Right(testFiveDayForecastEntity));
  });



}