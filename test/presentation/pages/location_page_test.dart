import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart';
import 'package:sunshine/presentation/home/bloc/forecast_event.dart';
import 'package:sunshine/presentation/home/bloc/forecast_state.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';
import 'package:sunshine/presentation/home/bloc/home_state.dart';
import 'package:sunshine/presentation/home/bloc/location_bloc.dart';
import 'package:sunshine/presentation/home/bloc/location_state.dart';
import 'package:sunshine/presentation/home/pages/mobile/home_mobile_page.dart';

import '../mock_bloc.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockHomeBloc mockHomeBloc;
  late MockForecastBloc mockForecastBloc;
  late MockLocationBloc mockLocationBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    mockForecastBloc = MockForecastBloc();
    mockLocationBloc = MockLocationBloc();
    HttpOverrides.global = null;
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => mockHomeBloc,
        ),
        BlocProvider<ForecastBloc>(
          create: (context) => mockForecastBloc,
        ),
        BlocProvider<LocationBloc>(
          create: (context) => mockLocationBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Search bar should trigger state to change from empty to loading',
      (widgetTester) async {
    //arrange
    when(() => mockHomeBloc.state).thenReturn(HomeInitState());
    when(() => mockForecastBloc.state).thenReturn(ForecastInitState());
    when(() => mockLocationBloc.state).thenReturn(LocationInitState());
    //act
    await widgetTester.pumpWidget(makeTestableWidget(const HomeMobilePage()));
    //assert
    expect(find.byType(SearchBar), findsOneWidget);
  });

  //TODO: search for loading state
  /*testWidgets('should show progress indicator when state is loading',
      (widgetTester) async {
    //arrange
    when(() => mockHomeBloc.state).thenReturn(HomeInitState());
    when(() => mockForecastBloc.state).thenReturn(ForecastLoadingState());
    //act
    await widgetTester.pumpWidget(makeTestableWidget(const HomeMobilePage()));
    var searchbar = find.byType(SearchAnchor);
    await widgetTester.tap(searchbar);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));


    //assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });*/

/*  testWidgets('should show progress indicator when state is loading',
          (widgetTester) async {
        //arrange
        when(() => mockHomeBloc.state).thenReturn(HomeInitState());
        when(() => mockForecastBloc.state).thenReturn(const ForecastLoadingState());
        //act
        await widgetTester.pumpWidget(makeTestableWidget(const HomeMobilePage()));
        var searchbar = find.byType(SearchAnchor);
        await widgetTester.tap(searchbar);
        searchbar.allCandidates.forEach((element) { print(element.runtimeType);});
        await widgetTester.pumpAndSettle(Duration(seconds: 2));


        //assert
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });*/

}
