import 'package:dartz/dartz.dart';
import 'package:sunshine/domain/entities/location.dart';

import '../../core/error/failure.dart';
import '../../core/utils/typedef.dart';
import '../entities/weather.dart';

abstract class WeatherRepository{

  ResultFuture<WeatherEntity> getCurrentWeather(String cityName);
}