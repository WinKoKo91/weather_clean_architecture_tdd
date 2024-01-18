// Mocks generated by Mockito 5.4.4 from annotations
// in sunshine/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i12;
import 'dart:convert' as _i30;
import 'dart:typed_data' as _i32;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter_bloc/flutter_bloc.dart' as _i25;
import 'package:http/http.dart' as _i11;
import 'package:intl/intl.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i31;
import 'package:sunshine/core/error/failure.dart' as _i13;
import 'package:sunshine/data/datasource/location_remote_data_source.dart'
    as _i28;
import 'package:sunshine/data/datasource/weather_remote_data_source.dart'
    as _i17;
import 'package:sunshine/data/model/air_pollution_model.dart' as _i5;
import 'package:sunshine/data/model/forecast_model.dart' as _i4;
import 'package:sunshine/data/model/location_model.dart' as _i29;
import 'package:sunshine/data/model/weather_model.dart' as _i3;
import 'package:sunshine/domain/entities/air_pollution_entity.dart' as _i16;
import 'package:sunshine/domain/entities/forecast_entity.dart' as _i15;
import 'package:sunshine/domain/entities/location.dart' as _i21;
import 'package:sunshine/domain/entities/weather.dart' as _i14;
import 'package:sunshine/domain/repositories/location_repository.dart' as _i7;
import 'package:sunshine/domain/repositories/weather_repository.dart' as _i6;
import 'package:sunshine/domain/usecases/get_current_weather.dart' as _i18;
import 'package:sunshine/domain/usecases/get_five_day_forecast.dart' as _i19;
import 'package:sunshine/domain/usecases/get_today_air_pollution.dart' as _i22;
import 'package:sunshine/domain/usecases/search_location_by_city_name.dart'
    as _i20;
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart' as _i26;
import 'package:sunshine/presentation/home/bloc/forecast_event.dart' as _i27;
import 'package:sunshine/presentation/home/bloc/forecast_state.dart' as _i10;
import 'package:sunshine/presentation/home/bloc/home_bloc.dart' as _i23;
import 'package:sunshine/presentation/home/bloc/home_event.dart' as _i24;
import 'package:sunshine/presentation/home/bloc/home_state.dart' as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeatherModel_1 extends _i1.SmartFake implements _i3.WeatherModel {
  _FakeWeatherModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForecastResponseModel_2 extends _i1.SmartFake
    implements _i4.ForecastResponseModel {
  _FakeForecastResponseModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAirPollutionResponseModel_3 extends _i1.SmartFake
    implements _i5.AirPollutionResponseModel {
  _FakeAirPollutionResponseModel_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeatherRepository_4 extends _i1.SmartFake
    implements _i6.WeatherRepository {
  _FakeWeatherRepository_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLocationRepository_5 extends _i1.SmartFake
    implements _i7.LocationRepository {
  _FakeLocationRepository_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDateFormat_6 extends _i1.SmartFake implements _i8.DateFormat {
  _FakeDateFormat_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHomeState_7 extends _i1.SmartFake implements _i9.HomeState {
  _FakeHomeState_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForecastState_8 extends _i1.SmartFake implements _i10.ForecastState {
  _FakeForecastState_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_9 extends _i1.SmartFake implements _i11.Response {
  _FakeResponse_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_10 extends _i1.SmartFake
    implements _i11.StreamedResponse {
  _FakeStreamedResponse_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepository extends _i1.Mock implements _i6.WeatherRepository {
  MockWeatherRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<_i2.Either<_i13.Failure, _i14.WeatherEntity>> getCurrentWeather(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeather,
          [cityName],
        ),
        returnValue:
            _i12.Future<_i2.Either<_i13.Failure, _i14.WeatherEntity>>.value(
                _FakeEither_0<_i13.Failure, _i14.WeatherEntity>(
          this,
          Invocation.method(
            #getCurrentWeather,
            [cityName],
          ),
        )),
      ) as _i12.Future<_i2.Either<_i13.Failure, _i14.WeatherEntity>>);

  @override
  _i12.Future<_i2.Either<_i13.Failure, _i15.ForecastResponseEntity>>
      getFiveDayForecast({
    required double? lat,
    required double? lon,
  }) =>
          (super.noSuchMethod(
            Invocation.method(
              #getFiveDayForecast,
              [],
              {
                #lat: lat,
                #lon: lon,
              },
            ),
            returnValue: _i12.Future<
                    _i2
                    .Either<_i13.Failure, _i15.ForecastResponseEntity>>.value(
                _FakeEither_0<_i13.Failure, _i15.ForecastResponseEntity>(
              this,
              Invocation.method(
                #getFiveDayForecast,
                [],
                {
                  #lat: lat,
                  #lon: lon,
                },
              ),
            )),
          ) as _i12
              .Future<_i2.Either<_i13.Failure, _i15.ForecastResponseEntity>>);

  @override
  _i12.Future<_i2.Either<_i13.Failure, _i16.AirPollutionResponseEntity>>
      getAirPollution({
    required double? lat,
    required double? lon,
  }) =>
          (super.noSuchMethod(
            Invocation.method(
              #getAirPollution,
              [],
              {
                #lat: lat,
                #lon: lon,
              },
            ),
            returnValue: _i12.Future<
                    _i2.Either<_i13.Failure,
                        _i16.AirPollutionResponseEntity>>.value(
                _FakeEither_0<_i13.Failure, _i16.AirPollutionResponseEntity>(
              this,
              Invocation.method(
                #getAirPollution,
                [],
                {
                  #lat: lat,
                  #lon: lon,
                },
              ),
            )),
          ) as _i12.Future<
              _i2.Either<_i13.Failure, _i16.AirPollutionResponseEntity>>);
}

/// A class which mocks [WeatherRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRemoteDataSource extends _i1.Mock
    implements _i17.WeatherRemoteDataSource {
  MockWeatherRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<_i3.WeatherModel> getCurrentWeather(String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeather,
          [cityName],
        ),
        returnValue: _i12.Future<_i3.WeatherModel>.value(_FakeWeatherModel_1(
          this,
          Invocation.method(
            #getCurrentWeather,
            [cityName],
          ),
        )),
      ) as _i12.Future<_i3.WeatherModel>);

  @override
  _i12.Future<_i4.ForecastResponseModel> getFiveDayForecast({
    required double? lat,
    required double? lon,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFiveDayForecast,
          [],
          {
            #lat: lat,
            #lon: lon,
          },
        ),
        returnValue: _i12.Future<_i4.ForecastResponseModel>.value(
            _FakeForecastResponseModel_2(
          this,
          Invocation.method(
            #getFiveDayForecast,
            [],
            {
              #lat: lat,
              #lon: lon,
            },
          ),
        )),
      ) as _i12.Future<_i4.ForecastResponseModel>);

  @override
  _i12.Future<_i5.AirPollutionResponseModel> getAirPollution({
    required double? lat,
    required double? lon,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAirPollution,
          [],
          {
            #lat: lat,
            #lon: lon,
          },
        ),
        returnValue: _i12.Future<_i5.AirPollutionResponseModel>.value(
            _FakeAirPollutionResponseModel_3(
          this,
          Invocation.method(
            #getAirPollution,
            [],
            {
              #lat: lat,
              #lon: lon,
            },
          ),
        )),
      ) as _i12.Future<_i5.AirPollutionResponseModel>);
}

/// A class which mocks [GetCurrentWeatherUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCurrentWeatherUseCase extends _i1.Mock
    implements _i18.GetCurrentWeatherUseCase {
  MockGetCurrentWeatherUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.WeatherRepository get weatherRepository => (super.noSuchMethod(
        Invocation.getter(#weatherRepository),
        returnValue: _FakeWeatherRepository_4(
          this,
          Invocation.getter(#weatherRepository),
        ),
      ) as _i6.WeatherRepository);

  @override
  _i12.Future<_i2.Either<_i13.Failure, _i14.WeatherEntity>> execute(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [cityName],
        ),
        returnValue:
            _i12.Future<_i2.Either<_i13.Failure, _i14.WeatherEntity>>.value(
                _FakeEither_0<_i13.Failure, _i14.WeatherEntity>(
          this,
          Invocation.method(
            #execute,
            [cityName],
          ),
        )),
      ) as _i12.Future<_i2.Either<_i13.Failure, _i14.WeatherEntity>>);
}

/// A class which mocks [GetFiveDayForecastUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetFiveDayForecastUseCase extends _i1.Mock
    implements _i19.GetFiveDayForecastUseCase {
  MockGetFiveDayForecastUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.WeatherRepository get weatherRepository => (super.noSuchMethod(
        Invocation.getter(#weatherRepository),
        returnValue: _FakeWeatherRepository_4(
          this,
          Invocation.getter(#weatherRepository),
        ),
      ) as _i6.WeatherRepository);

  @override
  _i12.Future<_i2.Either<_i13.Failure, _i15.ForecastResponseEntity>> call(
          _i19.GetFiveDayForecastParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i12.Future<
                _i2.Either<_i13.Failure, _i15.ForecastResponseEntity>>.value(
            _FakeEither_0<_i13.Failure, _i15.ForecastResponseEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i12.Future<_i2.Either<_i13.Failure, _i15.ForecastResponseEntity>>);
}

/// A class which mocks [SearchLocationsByCityNameUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchLocationsByCityNameUseCase extends _i1.Mock
    implements _i20.SearchLocationsByCityNameUseCase {
  MockSearchLocationsByCityNameUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.LocationRepository get locationRepository => (super.noSuchMethod(
        Invocation.getter(#locationRepository),
        returnValue: _FakeLocationRepository_5(
          this,
          Invocation.getter(#locationRepository),
        ),
      ) as _i7.LocationRepository);

  @override
  _i12.Future<_i2.Either<_i13.Failure, List<_i21.LocationEntity>>> call(
          _i20.SearchLocationsParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i12
            .Future<_i2.Either<_i13.Failure, List<_i21.LocationEntity>>>.value(
            _FakeEither_0<_i13.Failure, List<_i21.LocationEntity>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i12.Future<_i2.Either<_i13.Failure, List<_i21.LocationEntity>>>);
}

/// A class which mocks [GetTodayAirPollutionUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTodayAirPollutionUseCase extends _i1.Mock
    implements _i22.GetTodayAirPollutionUseCase {
  MockGetTodayAirPollutionUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.WeatherRepository get weatherRepository => (super.noSuchMethod(
        Invocation.getter(#weatherRepository),
        returnValue: _FakeWeatherRepository_4(
          this,
          Invocation.getter(#weatherRepository),
        ),
      ) as _i6.WeatherRepository);

  @override
  _i12.Future<_i2.Either<_i13.Failure, _i16.AirPollutionResponseEntity>> call(
          _i22.LocationParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i12.Future<
                _i2
                .Either<_i13.Failure, _i16.AirPollutionResponseEntity>>.value(
            _FakeEither_0<_i13.Failure, _i16.AirPollutionResponseEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i12
          .Future<_i2.Either<_i13.Failure, _i16.AirPollutionResponseEntity>>);
}

/// A class which mocks [HomeBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeBloc extends _i1.Mock implements _i23.HomeBloc {
  MockHomeBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.DateFormat get f => (super.noSuchMethod(
        Invocation.getter(#f),
        returnValue: _FakeDateFormat_6(
          this,
          Invocation.getter(#f),
        ),
      ) as _i8.DateFormat);

  @override
  _i9.HomeState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeHomeState_7(
          this,
          Invocation.getter(#state),
        ),
      ) as _i9.HomeState);

  @override
  _i12.Stream<_i9.HomeState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i12.Stream<_i9.HomeState>.empty(),
      ) as _i12.Stream<_i9.HomeState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void add(_i24.HomeEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i24.HomeEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i9.HomeState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i24.HomeEvent>(
    _i25.EventHandler<E, _i9.HomeState>? handler, {
    _i25.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i25.Transition<_i24.HomeEvent, _i9.HomeState>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i12.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);

  @override
  void onChange(_i25.Change<_i9.HomeState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ForecastBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockForecastBloc extends _i1.Mock implements _i26.ForecastBloc {
  MockForecastBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.DateFormat get f => (super.noSuchMethod(
        Invocation.getter(#f),
        returnValue: _FakeDateFormat_6(
          this,
          Invocation.getter(#f),
        ),
      ) as _i8.DateFormat);

  @override
  _i8.DateFormat get weekdayFormatter => (super.noSuchMethod(
        Invocation.getter(#weekdayFormatter),
        returnValue: _FakeDateFormat_6(
          this,
          Invocation.getter(#weekdayFormatter),
        ),
      ) as _i8.DateFormat);

  @override
  _i10.ForecastState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeForecastState_8(
          this,
          Invocation.getter(#state),
        ),
      ) as _i10.ForecastState);

  @override
  _i12.Stream<_i10.ForecastState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i12.Stream<_i10.ForecastState>.empty(),
      ) as _i12.Stream<_i10.ForecastState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void add(_i27.ForecastEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i27.ForecastEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i10.ForecastState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i27.ForecastEvent>(
    _i25.EventHandler<E, _i10.ForecastState>? handler, {
    _i25.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i25.Transition<_i27.ForecastEvent, _i10.ForecastState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i12.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);

  @override
  void onChange(_i25.Change<_i10.ForecastState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [LocationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocationRepository extends _i1.Mock
    implements _i7.LocationRepository {
  MockLocationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<
      _i2.Either<_i13.Failure, List<_i21.LocationEntity>>> searchCityListByName(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchCityListByName,
          [cityName],
        ),
        returnValue: _i12
            .Future<_i2.Either<_i13.Failure, List<_i21.LocationEntity>>>.value(
            _FakeEither_0<_i13.Failure, List<_i21.LocationEntity>>(
          this,
          Invocation.method(
            #searchCityListByName,
            [cityName],
          ),
        )),
      ) as _i12.Future<_i2.Either<_i13.Failure, List<_i21.LocationEntity>>>);
}

/// A class which mocks [LocationRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocationRemoteDataSource extends _i1.Mock
    implements _i28.LocationRemoteDataSource {
  MockLocationRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<List<_i29.LocationModel>> searchCityListByName(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchCityListByName,
          [cityName],
        ),
        returnValue:
            _i12.Future<List<_i29.LocationModel>>.value(<_i29.LocationModel>[]),
      ) as _i12.Future<List<_i29.LocationModel>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i11.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<_i11.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<_i11.Response>.value(_FakeResponse_9(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i12.Future<_i11.Response>);

  @override
  _i12.Future<_i11.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<_i11.Response>.value(_FakeResponse_9(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i12.Future<_i11.Response>);

  @override
  _i12.Future<_i11.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i30.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i12.Future<_i11.Response>.value(_FakeResponse_9(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i12.Future<_i11.Response>);

  @override
  _i12.Future<_i11.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i30.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i12.Future<_i11.Response>.value(_FakeResponse_9(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i12.Future<_i11.Response>);

  @override
  _i12.Future<_i11.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i30.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i12.Future<_i11.Response>.value(_FakeResponse_9(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i12.Future<_i11.Response>);

  @override
  _i12.Future<_i11.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i30.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i12.Future<_i11.Response>.value(_FakeResponse_9(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i12.Future<_i11.Response>);

  @override
  _i12.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<String>.value(_i31.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i12.Future<String>);

  @override
  _i12.Future<_i32.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i12.Future<_i32.Uint8List>.value(_i32.Uint8List(0)),
      ) as _i12.Future<_i32.Uint8List>);

  @override
  _i12.Future<_i11.StreamedResponse> send(_i11.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i12.Future<_i11.StreamedResponse>.value(_FakeStreamedResponse_10(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i12.Future<_i11.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
