import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/core/error/exception.dart';
import 'package:sunshine/core/error/failure.dart';
import 'package:sunshine/data/model/location_model.dart';
import 'package:sunshine/data/repository/location_repository_impl.dart';
import 'package:sunshine/domain/entities/location.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockLocationRemoteDataSource mockLocationRemoteDataSource;
  late LocationRepositoryImpl locationRepositoryImpl;

  setUp(() {
    mockLocationRemoteDataSource = MockLocationRemoteDataSource();
    locationRepositoryImpl = LocationRepositoryImpl(
      locationRemoteDataSource: mockLocationRemoteDataSource,
    );
  });

  const testLocationModel = [
    LocationModel(
        name: "Yangon",
        lat: 16.7967129,
        lon: 96.1609916,
        country: "MM",
        state: "Yangon")
  ];



  const testCityName = 'Yangon';

  group('get city list by name', () {
    test(
      'should return current location when a call to data source is successful',
      () async {
        // arrange
        when(mockLocationRemoteDataSource.searchCityListByName(testCityName))
            .thenAnswer((_) async => testLocationModel);
        final locations = testLocationModel.map((e) => e.toEntity()).toList();

        // act
        final result =
            await locationRepositoryImpl.searchCityListByName(testCityName);

        // assert
        expect(result, isA<Right<dynamic, List<LocationEntity>>>());
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockLocationRemoteDataSource.searchCityListByName(testCityName))
            .thenThrow(ServerException());

        // act
        final result =
            await locationRepositoryImpl.searchCityListByName(testCityName);

        // assert
        expect(
            result, equals(const Left(ServerFailure('An error has occurred'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockLocationRemoteDataSource.searchCityListByName(testCityName))
            .thenThrow(
                const SocketException('Failed to connect to the network'));

        // act
        final result =
            await locationRepositoryImpl.searchCityListByName(testCityName);

        // assert
        expect(
            result,
            equals(const Left(
                ConnectionFailure('Failed to connect to the network'))));
      },
    );
  });
}
