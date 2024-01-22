import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/core/error/failure.dart';
import 'package:sunshine/domain/entities/location.dart';
import 'package:sunshine/domain/usecases/search_location_by_city_name.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';
import 'package:sunshine/presentation/home/bloc/location_bloc.dart';
import 'package:sunshine/presentation/home/bloc/location_event.dart';
import 'package:sunshine/presentation/home/bloc/location_state.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockSearchLocationsByCityNameUseCase
      mockSearchLocationsByCityNameUseCase;

  late LocationBloc locationBloc;

  setUp(() {
    mockSearchLocationsByCityNameUseCase =
        MockSearchLocationsByCityNameUseCase();

    locationBloc = LocationBloc( mockSearchLocationsByCityNameUseCase);
  });

  const testLocationEntities = [
    LocationEntity(
        name: "Yangon",
        lat: 16.7967129,
        lon: 96.1609916,
        country: "MM",
        state: "Yangon")
  ];

  const testCityName = 'Yangon';
  const testCityNameParam = SearchLocationsParams(testCityName);

  test('initial state should be empty', () {
    expect(locationBloc.state, LocationInitState());
  });

  blocTest<LocationBloc, LocationState>(
      "should emit [HomeCitySearchingState, HomeSearchCityResult] when data is gotten successfully",
      build: () {
        when(mockSearchLocationsByCityNameUseCase.call(testCityNameParam))
            .thenAnswer((_) async => const Right(testLocationEntities));
        return locationBloc;
      },
      act: (bloc) => bloc.add(const OnCitySubmit(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            LocationSearchingState(),
            const LocationSearchSuccessState(testLocationEntities)
          ]);

  blocTest<LocationBloc, LocationState>(
      "should emit [LocationSearchingState, LocationFailState] when data is gotten successfully",
      build: () {
        when(mockSearchLocationsByCityNameUseCase.call(testCityNameParam))
            .thenAnswer(
                (_) async => const Left(ServerFailure('Server failure')));
        return locationBloc;
      },
      act: (bloc) => bloc.add(const OnCitySubmit(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            LocationSearchingState(),
            const LocationFailState('Server failure'),
          ]);
}
