import 'package:dartz/dartz.dart';
import 'package:sunshine/core/utils/typedef.dart';
import 'package:sunshine/domain/entities/location.dart';

import '../../core/error/failure.dart';
import '../entities/weather.dart';

abstract class LocationRepository{

  ResultFuture<List<LocationEntity>> searchCityListByName(String cityName);
}