import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sunshine/core/error/failure.dart';
import 'package:sunshine/domain/entities/location.dart';
import 'package:sunshine/domain/usecases/search_location_by_city_name.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockSearchLocationsByCityNameUseCase
      mockSearchLocationsByCityNameUseCase;

  late MockGetCurrentWeatherUseCase mockGetCurrentWeatherUseCase;
  late HomeBloc homeBloc;

  setUp(() {
    mockSearchLocationsByCityNameUseCase =
        MockSearchLocationsByCityNameUseCase();
    mockGetCurrentWeatherUseCase = MockGetCurrentWeatherUseCase();

    homeBloc = HomeBloc(
        mockGetCurrentWeatherUseCase, mockSearchLocationsByCityNameUseCase);
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
    expect(homeBloc.state, HomeInitState());
  });

  blocTest<HomeBloc, HomeState>(
      "should emit [HomeCitySearchingState, HomeSearchCityResult] when data is gotten successfully",
      build: () {
        when(mockSearchLocationsByCityNameUseCase.call(testCityNameParam))
            .thenAnswer((_) async => const Right(testLocationEntities));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const OnCitySubmit(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            LocationSearchingState(),
            const LocationSearchSuccessState(testLocationEntities)
          ]);

  blocTest<HomeBloc, HomeState>(
      "should emit [HomeCitySearchingState, HomeSearchCityResult] when data is gotten successfully",
      build: () {
        when(mockSearchLocationsByCityNameUseCase.call(testCityNameParam))
            .thenAnswer(
                (_) async => const Left(ServerFailure('Server failure')));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const OnCitySubmit(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            LocationSearchingState(),
            const HomeFailState('Server failure'),
          ]);
}
