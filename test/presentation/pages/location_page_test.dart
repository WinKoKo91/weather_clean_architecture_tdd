import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sunshine/domain/entities/location.dart';
import 'package:sunshine/domain/usecases/search_location_by_city_name.dart';

import 'package:sunshine/presentation/home/bloc/home_event.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';
import 'package:sunshine/presentation/home/pages/home_page.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/widgets/search_bar_widget.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState>     implements HomeBloc  {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    HttpOverrides.global = null;
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

  Widget makeTestableWidget(Widget body) {
    return BlocProvider(
      create: (context) => mockHomeBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

   //TODO: widget test for search ui
  /*testWidgets(
      'Search bar should trigger state to change from empty to loading',
      (widgetTester) async {
    //arrange
    when(() => mockHomeBloc.state).thenReturn( HomeInitState());
    //act
    await widgetTester.pumpWidget(makeTestableWidget(const SearchBarWidget()));
    //assert
    expect(find.byType(SearchBar), findsOneWidget);
  });*/



}
