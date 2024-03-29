// Mocks generated by Mockito 5.4.4 from annotations
// in sunshine/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i14;
import 'dart:convert' as _i35;
import 'dart:typed_data' as _i37;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter_bloc/flutter_bloc.dart' as _i28;
import 'package:http/http.dart' as _i13;
import 'package:intl/intl.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i36;
import 'package:sunshine/core/error/failure.dart' as _i15;
import 'package:sunshine/data/datasource/local/weather_local_data_source.dart'
    as _i19;
import 'package:sunshine/data/datasource/remote/location_remote_data_source.dart'
    as _i33;
import 'package:sunshine/data/datasource/remote/weather_remote_data_source.dart'
    as _i18;
import 'package:sunshine/data/model/air_pollution_model.dart' as _i5;
import 'package:sunshine/data/model/forecast_model.dart' as _i4;
import 'package:sunshine/data/model/location_model.dart' as _i34;
import 'package:sunshine/data/model/weather_model.dart' as _i3;
import 'package:sunshine/domain/entities/air_pollution_entity.dart' as _i6;
import 'package:sunshine/domain/entities/forecast_entity.dart' as _i17;
import 'package:sunshine/domain/entities/location.dart' as _i24;
import 'package:sunshine/domain/entities/weather_entity.dart' as _i16;
import 'package:sunshine/domain/repositories/location_repository.dart' as _i8;
import 'package:sunshine/domain/repositories/weather_repository.dart' as _i7;
import 'package:sunshine/domain/usecases/get_current_weather_by_location.dart'
    as _i21;
import 'package:sunshine/domain/usecases/get_current_weather_by_name.dart'
    as _i20;
import 'package:sunshine/domain/usecases/get_five_day_forecast.dart' as _i22;
import 'package:sunshine/domain/usecases/get_today_air_pollution.dart' as _i25;
import 'package:sunshine/domain/usecases/search_location_by_city_name.dart'
    as _i23;
import 'package:sunshine/presentation/home/bloc/forecast_bloc.dart' as _i29;
import 'package:sunshine/presentation/home/bloc/forecast_event.dart' as _i30;
import 'package:sunshine/presentation/home/bloc/forecast_state.dart' as _i11;
import 'package:sunshine/presentation/home/bloc/home_bloc.dart' as _i26;
import 'package:sunshine/presentation/home/bloc/home_event.dart' as _i27;
import 'package:sunshine/presentation/home/bloc/home_state.dart' as _i10;
import 'package:sunshine/presentation/home/bloc/location_bloc.dart' as _i31;
import 'package:sunshine/presentation/home/bloc/location_event.dart' as _i32;
import 'package:sunshine/presentation/home/bloc/location_state.dart' as _i12;

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

class _FakeAirPollutionResponseEntity_4 extends _i1.SmartFake
    implements _i6.AirPollutionResponseEntity {
  _FakeAirPollutionResponseEntity_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeatherRepository_5 extends _i1.SmartFake
    implements _i7.WeatherRepository {
  _FakeWeatherRepository_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLocationRepository_6 extends _i1.SmartFake
    implements _i8.LocationRepository {
  _FakeLocationRepository_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDateFormat_7 extends _i1.SmartFake implements _i9.DateFormat {
  _FakeDateFormat_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHomeState_8 extends _i1.SmartFake implements _i10.HomeState {
  _FakeHomeState_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeatherLoaded_9 extends _i1.SmartFake implements _i10.WeatherLoaded {
  _FakeWeatherLoaded_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForecastState_10 extends _i1.SmartFake
    implements _i11.ForecastState {
  _FakeForecastState_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLocationState_11 extends _i1.SmartFake
    implements _i12.LocationState {
  _FakeLocationState_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_12 extends _i1.SmartFake implements _i13.Response {
  _FakeResponse_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_13 extends _i1.SmartFake
    implements _i13.StreamedResponse {
  _FakeStreamedResponse_13(
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
class MockWeatherRepository extends _i1.Mock implements _i7.WeatherRepository {
  MockWeatherRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>> getCurrentWeather(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeather,
          [cityName],
        ),
        returnValue:
            _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>>.value(
                _FakeEither_0<_i15.Failure, _i16.WeatherEntity>(
          this,
          Invocation.method(
            #getCurrentWeather,
            [cityName],
          ),
        )),
      ) as _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>>);

  @override
  _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>>
      getCurrentWeatherByLocation({
    double? lat,
    required double? lon,
  }) =>
          (super.noSuchMethod(
            Invocation.method(
              #getCurrentWeatherByLocation,
              [],
              {
                #lat: lat,
                #lon: lon,
              },
            ),
            returnValue:
                _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>>.value(
                    _FakeEither_0<_i15.Failure, _i16.WeatherEntity>(
              this,
              Invocation.method(
                #getCurrentWeatherByLocation,
                [],
                {
                  #lat: lat,
                  #lon: lon,
                },
              ),
            )),
          ) as _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>>);

  @override
  _i14.Future<_i2.Either<_i15.Failure, _i17.ForecastResponseEntity>>
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
            returnValue: _i14.Future<
                    _i2
                    .Either<_i15.Failure, _i17.ForecastResponseEntity>>.value(
                _FakeEither_0<_i15.Failure, _i17.ForecastResponseEntity>(
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
          ) as _i14
              .Future<_i2.Either<_i15.Failure, _i17.ForecastResponseEntity>>);

  @override
  _i14.Future<
      _i2
      .Either<_i15.Failure, _i6.AirPollutionResponseEntity>> getAirPollution({
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
        returnValue: _i14.Future<
                _i2.Either<_i15.Failure, _i6.AirPollutionResponseEntity>>.value(
            _FakeEither_0<_i15.Failure, _i6.AirPollutionResponseEntity>(
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
      ) as _i14
          .Future<_i2.Either<_i15.Failure, _i6.AirPollutionResponseEntity>>);
}

/// A class which mocks [WeatherRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRemoteDataSource extends _i1.Mock
    implements _i18.WeatherRemoteDataSource {
  MockWeatherRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i14.Future<_i3.WeatherModel> getCurrentWeather(String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeather,
          [cityName],
        ),
        returnValue: _i14.Future<_i3.WeatherModel>.value(_FakeWeatherModel_1(
          this,
          Invocation.method(
            #getCurrentWeather,
            [cityName],
          ),
        )),
      ) as _i14.Future<_i3.WeatherModel>);

  @override
  _i14.Future<_i3.WeatherModel> getCurrentWeatherByLocation({
    required double? lat,
    required double? lon,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeatherByLocation,
          [],
          {
            #lat: lat,
            #lon: lon,
          },
        ),
        returnValue: _i14.Future<_i3.WeatherModel>.value(_FakeWeatherModel_1(
          this,
          Invocation.method(
            #getCurrentWeatherByLocation,
            [],
            {
              #lat: lat,
              #lon: lon,
            },
          ),
        )),
      ) as _i14.Future<_i3.WeatherModel>);

  @override
  _i14.Future<_i4.ForecastResponseModel> getFiveDayForecast({
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
        returnValue: _i14.Future<_i4.ForecastResponseModel>.value(
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
      ) as _i14.Future<_i4.ForecastResponseModel>);

  @override
  _i14.Future<_i5.AirPollutionResponseModel> getAirPollution({
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
        returnValue: _i14.Future<_i5.AirPollutionResponseModel>.value(
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
      ) as _i14.Future<_i5.AirPollutionResponseModel>);
}

/// A class which mocks [WeatherLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherLocalDataSource extends _i1.Mock
    implements _i19.WeatherLocalDataSource {
  MockWeatherLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i14.Future<bool> initDb() => (super.noSuchMethod(
        Invocation.method(
          #initDb,
          [],
        ),
        returnValue: _i14.Future<bool>.value(false),
      ) as _i14.Future<bool>);

  @override
  dynamic saveCurrentWeather(_i16.WeatherEntity? weatherEntity) =>
      super.noSuchMethod(Invocation.method(
        #saveCurrentWeather,
        [weatherEntity],
      ));

  @override
  dynamic saveFiveDayForecast(
          _i17.ForecastResponseEntity? forecastResponseEntity) =>
      super.noSuchMethod(Invocation.method(
        #saveFiveDayForecast,
        [forecastResponseEntity],
      ));

  @override
  _i6.AirPollutionResponseEntity getAirPollution() => (super.noSuchMethod(
        Invocation.method(
          #getAirPollution,
          [],
        ),
        returnValue: _FakeAirPollutionResponseEntity_4(
          this,
          Invocation.method(
            #getAirPollution,
            [],
          ),
        ),
      ) as _i6.AirPollutionResponseEntity);
}

/// A class which mocks [GetCurrentWeatherByNameUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCurrentWeatherByNameUseCase extends _i1.Mock
    implements _i20.GetCurrentWeatherByNameUseCase {
  MockGetCurrentWeatherByNameUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.WeatherRepository get weatherRepository => (super.noSuchMethod(
        Invocation.getter(#weatherRepository),
        returnValue: _FakeWeatherRepository_5(
          this,
          Invocation.getter(#weatherRepository),
        ),
      ) as _i7.WeatherRepository);

  @override
  _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>> call(
          String? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>>.value(
                _FakeEither_0<_i15.Failure, _i16.WeatherEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>>);
}

/// A class which mocks [GetCurrentWeatherByLocationUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCurrentWeatherByLocationUseCase extends _i1.Mock
    implements _i21.GetCurrentWeatherByLocationUseCase {
  MockGetCurrentWeatherByLocationUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.WeatherRepository get weatherRepository => (super.noSuchMethod(
        Invocation.getter(#weatherRepository),
        returnValue: _FakeWeatherRepository_5(
          this,
          Invocation.getter(#weatherRepository),
        ),
      ) as _i7.WeatherRepository);

  @override
  _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>> call(
          _i21.CurrentLocationsParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>>.value(
                _FakeEither_0<_i15.Failure, _i16.WeatherEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i14.Future<_i2.Either<_i15.Failure, _i16.WeatherEntity>>);
}

/// A class which mocks [GetFiveDayForecastUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetFiveDayForecastUseCase extends _i1.Mock
    implements _i22.GetFiveDayForecastUseCase {
  MockGetFiveDayForecastUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.WeatherRepository get weatherRepository => (super.noSuchMethod(
        Invocation.getter(#weatherRepository),
        returnValue: _FakeWeatherRepository_5(
          this,
          Invocation.getter(#weatherRepository),
        ),
      ) as _i7.WeatherRepository);

  @override
  _i14.Future<_i2.Either<_i15.Failure, _i17.ForecastResponseEntity>> call(
          _i22.GetFiveDayForecastParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i14.Future<
                _i2.Either<_i15.Failure, _i17.ForecastResponseEntity>>.value(
            _FakeEither_0<_i15.Failure, _i17.ForecastResponseEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i14.Future<_i2.Either<_i15.Failure, _i17.ForecastResponseEntity>>);
}

/// A class which mocks [SearchLocationsByCityNameUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchLocationsByCityNameUseCase extends _i1.Mock
    implements _i23.SearchLocationsByCityNameUseCase {
  MockSearchLocationsByCityNameUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.LocationRepository get locationRepository => (super.noSuchMethod(
        Invocation.getter(#locationRepository),
        returnValue: _FakeLocationRepository_6(
          this,
          Invocation.getter(#locationRepository),
        ),
      ) as _i8.LocationRepository);

  @override
  _i14.Future<_i2.Either<_i15.Failure, List<_i24.LocationEntity>>> call(
          _i23.SearchLocationsParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i14
            .Future<_i2.Either<_i15.Failure, List<_i24.LocationEntity>>>.value(
            _FakeEither_0<_i15.Failure, List<_i24.LocationEntity>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i14.Future<_i2.Either<_i15.Failure, List<_i24.LocationEntity>>>);
}

/// A class which mocks [GetTodayAirPollutionUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTodayAirPollutionUseCase extends _i1.Mock
    implements _i25.GetTodayAirPollutionUseCase {
  MockGetTodayAirPollutionUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.WeatherRepository get weatherRepository => (super.noSuchMethod(
        Invocation.getter(#weatherRepository),
        returnValue: _FakeWeatherRepository_5(
          this,
          Invocation.getter(#weatherRepository),
        ),
      ) as _i7.WeatherRepository);

  @override
  _i14.Future<_i2.Either<_i15.Failure, _i6.AirPollutionResponseEntity>> call(
          _i25.LocationParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i14.Future<
                _i2.Either<_i15.Failure, _i6.AirPollutionResponseEntity>>.value(
            _FakeEither_0<_i15.Failure, _i6.AirPollutionResponseEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i14
          .Future<_i2.Either<_i15.Failure, _i6.AirPollutionResponseEntity>>);
}

/// A class which mocks [HomeBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeBloc extends _i1.Mock implements _i26.HomeBloc {
  MockHomeBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.DateFormat get f => (super.noSuchMethod(
        Invocation.getter(#f),
        returnValue: _FakeDateFormat_7(
          this,
          Invocation.getter(#f),
        ),
      ) as _i9.DateFormat);

  @override
  _i10.HomeState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeHomeState_8(
          this,
          Invocation.getter(#state),
        ),
      ) as _i10.HomeState);

  @override
  _i14.Stream<_i10.HomeState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i14.Stream<_i10.HomeState>.empty(),
      ) as _i14.Stream<_i10.HomeState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i10.WeatherLoaded filterData(_i16.WeatherEntity? data) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterData,
          [data],
        ),
        returnValue: _FakeWeatherLoaded_9(
          this,
          Invocation.method(
            #filterData,
            [data],
          ),
        ),
      ) as _i10.WeatherLoaded);

  @override
  void add(_i27.HomeEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i27.HomeEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i10.HomeState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i27.HomeEvent>(
    _i28.EventHandler<E, _i10.HomeState>? handler, {
    _i28.EventTransformer<E>? transformer,
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
          _i28.Transition<_i27.HomeEvent, _i10.HomeState>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i14.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i14.Future<void>.value(),
        returnValueForMissingStub: _i14.Future<void>.value(),
      ) as _i14.Future<void>);

  @override
  void onChange(_i28.Change<_i10.HomeState>? change) => super.noSuchMethod(
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
class MockForecastBloc extends _i1.Mock implements _i29.ForecastBloc {
  MockForecastBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.DateFormat get f => (super.noSuchMethod(
        Invocation.getter(#f),
        returnValue: _FakeDateFormat_7(
          this,
          Invocation.getter(#f),
        ),
      ) as _i9.DateFormat);

  @override
  _i9.DateFormat get weekdayFormatter => (super.noSuchMethod(
        Invocation.getter(#weekdayFormatter),
        returnValue: _FakeDateFormat_7(
          this,
          Invocation.getter(#weekdayFormatter),
        ),
      ) as _i9.DateFormat);

  @override
  _i11.ForecastState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeForecastState_10(
          this,
          Invocation.getter(#state),
        ),
      ) as _i11.ForecastState);

  @override
  _i14.Stream<_i11.ForecastState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i14.Stream<_i11.ForecastState>.empty(),
      ) as _i14.Stream<_i11.ForecastState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void add(_i30.ForecastEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i30.ForecastEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i11.ForecastState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i30.ForecastEvent>(
    _i28.EventHandler<E, _i11.ForecastState>? handler, {
    _i28.EventTransformer<E>? transformer,
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
          _i28.Transition<_i30.ForecastEvent, _i11.ForecastState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i14.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i14.Future<void>.value(),
        returnValueForMissingStub: _i14.Future<void>.value(),
      ) as _i14.Future<void>);

  @override
  void onChange(_i28.Change<_i11.ForecastState>? change) => super.noSuchMethod(
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

/// A class which mocks [LocationBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocationBloc extends _i1.Mock implements _i31.LocationBloc {
  MockLocationBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.DateFormat get f => (super.noSuchMethod(
        Invocation.getter(#f),
        returnValue: _FakeDateFormat_7(
          this,
          Invocation.getter(#f),
        ),
      ) as _i9.DateFormat);

  @override
  _i12.LocationState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeLocationState_11(
          this,
          Invocation.getter(#state),
        ),
      ) as _i12.LocationState);

  @override
  _i14.Stream<_i12.LocationState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i14.Stream<_i12.LocationState>.empty(),
      ) as _i14.Stream<_i12.LocationState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i14.Future<bool> requestLocationPermission() => (super.noSuchMethod(
        Invocation.method(
          #requestLocationPermission,
          [],
        ),
        returnValue: _i14.Future<bool>.value(false),
      ) as _i14.Future<bool>);

  @override
  void add(_i32.LocationEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i32.LocationEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i12.LocationState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i32.LocationEvent>(
    _i28.EventHandler<E, _i12.LocationState>? handler, {
    _i28.EventTransformer<E>? transformer,
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
          _i28.Transition<_i32.LocationEvent, _i12.LocationState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i14.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i14.Future<void>.value(),
        returnValueForMissingStub: _i14.Future<void>.value(),
      ) as _i14.Future<void>);

  @override
  void onChange(_i28.Change<_i12.LocationState>? change) => super.noSuchMethod(
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
    implements _i8.LocationRepository {
  MockLocationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i14.Future<
      _i2.Either<_i15.Failure, List<_i24.LocationEntity>>> searchCityListByName(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchCityListByName,
          [cityName],
        ),
        returnValue: _i14
            .Future<_i2.Either<_i15.Failure, List<_i24.LocationEntity>>>.value(
            _FakeEither_0<_i15.Failure, List<_i24.LocationEntity>>(
          this,
          Invocation.method(
            #searchCityListByName,
            [cityName],
          ),
        )),
      ) as _i14.Future<_i2.Either<_i15.Failure, List<_i24.LocationEntity>>>);
}

/// A class which mocks [LocationRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocationRemoteDataSource extends _i1.Mock
    implements _i33.LocationRemoteDataSource {
  MockLocationRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i14.Future<List<_i34.LocationModel>> searchCityListByName(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchCityListByName,
          [cityName],
        ),
        returnValue:
            _i14.Future<List<_i34.LocationModel>>.value(<_i34.LocationModel>[]),
      ) as _i14.Future<List<_i34.LocationModel>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i13.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i14.Future<_i13.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i14.Future<_i13.Response>.value(_FakeResponse_12(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i14.Future<_i13.Response>);

  @override
  _i14.Future<_i13.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i14.Future<_i13.Response>.value(_FakeResponse_12(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i14.Future<_i13.Response>);

  @override
  _i14.Future<_i13.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i35.Encoding? encoding,
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
        returnValue: _i14.Future<_i13.Response>.value(_FakeResponse_12(
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
      ) as _i14.Future<_i13.Response>);

  @override
  _i14.Future<_i13.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i35.Encoding? encoding,
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
        returnValue: _i14.Future<_i13.Response>.value(_FakeResponse_12(
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
      ) as _i14.Future<_i13.Response>);

  @override
  _i14.Future<_i13.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i35.Encoding? encoding,
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
        returnValue: _i14.Future<_i13.Response>.value(_FakeResponse_12(
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
      ) as _i14.Future<_i13.Response>);

  @override
  _i14.Future<_i13.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i35.Encoding? encoding,
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
        returnValue: _i14.Future<_i13.Response>.value(_FakeResponse_12(
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
      ) as _i14.Future<_i13.Response>);

  @override
  _i14.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i14.Future<String>.value(_i36.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i14.Future<String>);

  @override
  _i14.Future<_i37.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i14.Future<_i37.Uint8List>.value(_i37.Uint8List(0)),
      ) as _i14.Future<_i37.Uint8List>);

  @override
  _i14.Future<_i13.StreamedResponse> send(_i13.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i14.Future<_i13.StreamedResponse>.value(_FakeStreamedResponse_13(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i14.Future<_i13.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
