import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/domain/entities/location.dart';
import 'package:sunshine/domain/usecases/search_location_by_city_name.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchLocationsByCityNameUseCase searchLocationsByCityNameUseCase;
  late MockLocationRepository mockLocationRepository;

  setUp(() {
    mockLocationRepository = MockLocationRepository();
    searchLocationsByCityNameUseCase =
        SearchLocationsByCityNameUseCase(mockLocationRepository);
  });

  String testCityName = 'Yangon';

  const testLocationEntities = [
    LocationEntity(
        name: "Yangon",
        lat: 16.7967129,
        lon: 96.1609916,
        country: "MM",
        state: "Yangon")
  ];

  test('should get location list from the repository', () async {
    // arrange
    when(mockLocationRepository.searchCityListByName(testCityName))
        .thenAnswer((_) async => const Right(testLocationEntities));
    final params = SearchLocationsParams(testCityName);
    // act
    final result = await searchLocationsByCityNameUseCase.call(params);

    // assert
    expect(result, const Right(testLocationEntities));
  });
}
