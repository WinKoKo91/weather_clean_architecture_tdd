import 'package:sunshine/core/utils/typedef.dart';
import 'package:sunshine/domain/entities/location.dart';

abstract class LocationRepository{

  ResultFuture<List<LocationEntity>> searchCityListByName(String cityName);

}