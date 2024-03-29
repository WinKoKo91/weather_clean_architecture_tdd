import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/domain/entities/location.dart';
import 'package:sunshine/domain/usecases/search_location_by_city_name.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchLocationsByCityNameUseCase searchLocationsByCityNameUseCase;
  late MockLocationRepository mockLocationRepository;
  final faker = Faker();
  setUp(() {
    mockLocationRepository = MockLocationRepository();
    searchLocationsByCityNameUseCase =
        SearchLocationsByCityNameUseCase(mockLocationRepository);
  });

  String testCityName = faker.address.city();
  final testLocationEntities = [
    LocationEntity(
      name: testCityName,
      lat: faker.geo.latitude(),
      lon: faker.geo.longitude(),
      country: faker.address.countryCode(),
      state: faker.address.country(),
    )
  ];

  test('should get location list from the repository', () async {
    // arrange
    when(mockLocationRepository.searchCityListByName(testCityName))
        .thenAnswer((_) async => Right(testLocationEntities));
    final params = SearchLocationsParams(testCityName);
    // act
    final result = await searchLocationsByCityNameUseCase.call(params);

    // assert
    expect(result, Right(testLocationEntities));
  });
}
