import 'package:equatable/equatable.dart';
import 'package:sunshine/core/usecase/usecase.dart';
import 'package:sunshine/domain/entities/location.dart';

import '../../core/utils/typedef.dart';
import '../repositories/location_repository.dart';

class SearchLocationsByCityNameUseCase
    extends UseCaseWithParams<List<LocationEntity>, SearchLocationsParams> {

  final LocationRepository locationRepository;

  SearchLocationsByCityNameUseCase(this.locationRepository);

  @override
  ResultFuture<List<LocationEntity>> call(SearchLocationsParams params) {
    return locationRepository.searchCityListByName(params.cityName);
  }
}

class SearchLocationsParams extends Equatable {
  final String cityName;

  const SearchLocationsParams(this.cityName);

  @override
  List<Object?> get props => [cityName];
}
