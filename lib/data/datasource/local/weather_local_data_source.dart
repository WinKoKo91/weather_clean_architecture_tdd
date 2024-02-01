import 'dart:convert';

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sunshine/domain/entities/forecast_entity.dart';
import 'package:sunshine/domain/entities/weather_entity.dart';
import '../../../domain/entities/air_pollution_entity.dart';
import '../../model/air_pollution_model.dart';
import '../../model/forecast_model.dart';
import '../../model/weather_model.dart';

abstract class WeatherLocalDataSource {
  Future<bool> initDb();

  WeatherEntity? getCurrentWeather();

  WeatherEntity? getCurrentWeatherByLocation();

  saveCurrentWeather(WeatherEntity weatherEntity);

  ForecastResponseEntity? getFiveDayForecast();

  saveFiveDayForecast(ForecastResponseEntity forecastResponseEntity);

  AirPollutionResponseEntity getAirPollution();

  saveAirPollution(AirPollutionResponseEntity? airPollutionResponseEntity);
}

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  final _kWeatherBox = 'weather_box';
  final _kForecastListBox = 'forecast_list_box';
  final _kForecastBox = 'forecast_box';
  final _kAirPollutionListBox = 'air_pollution_list_box';
  final _kAirPollutionBox = 'air_pollution_box';

  @override
  Future<bool> initDb() async {
    try {
      if (!foundation.kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        await Hive.initFlutter(appDocumentDir.path);
      }
      if (!Hive.isAdapterRegistered(WeatherEntityAdapter().typeId)) {
        Hive.registerAdapter(WeatherEntityAdapter());
        await Hive.openBox<WeatherEntity>(_kWeatherBox);
      }

      if (!Hive.isAdapterRegistered(ForecastEntityAdapter().typeId)) {
        Hive.registerAdapter(ForecastEntityAdapter());
        await Hive.openBox<ForecastEntity>(_kForecastBox);
      }

      if (!Hive.isAdapterRegistered(ForecastResponseEntityAdapter().typeId)) {
        Hive.registerAdapter(ForecastResponseEntityAdapter());
        await Hive.openBox<ForecastResponseEntity>(_kForecastListBox);
      }

      if (!Hive.isAdapterRegistered(AirPollutionEntityAdapter().typeId)) {
        Hive.registerAdapter(AirPollutionEntityAdapter());
        await Hive.openBox<AirPollutionResponseEntity>(_kAirPollutionBox);
      }

      if (!Hive.isAdapterRegistered(
          AirPollutionResponseEntityAdapter().typeId)) {
        Hive.registerAdapter(AirPollutionResponseEntityAdapter());
        await Hive.openBox<AirPollutionResponseEntity>(_kAirPollutionListBox);
      }

      return true;
    } catch (e, sourceTrace) {
      if (kDebugMode) {
        print(e);
        print(sourceTrace);
      }

      rethrow;
    }
  }

  @override
  WeatherEntity? getCurrentWeather() {
    final Box weatherBox = Hive.box<WeatherEntity>(_kWeatherBox);

    return weatherBox.get('weather');
  }

  @override
  WeatherEntity? getCurrentWeatherByLocation() {
    try {
      final Box weatherBox = Hive.box<WeatherEntity>(_kWeatherBox);
      return weatherBox.get('weather');
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  AirPollutionResponseEntity getAirPollution() {
    final Box airPollutionBox =
    Hive.box<AirPollutionResponseEntity>(_kAirPollutionListBox);
    return airPollutionBox.get('air_pollution');
  }

  @override
  ForecastResponseEntity? getFiveDayForecast() {
    final Box forecastBox = Hive.box<ForecastResponseEntity>(_kForecastListBox);
    return forecastBox.get('forecast');
  }

  @override
  saveAirPollution(AirPollutionResponseEntity? airPollutionResponseEntity) {
    final Box airPollutionBox =
    Hive.box<AirPollutionResponseEntity>(_kAirPollutionListBox);
    return airPollutionBox.put('air_pollution', airPollutionResponseEntity);
  }

  @override
  saveCurrentWeather(WeatherEntity weatherEntity) {
    final Box weatherBox = Hive.box<WeatherEntity>(_kWeatherBox);
    return weatherBox.put('weather', weatherEntity);
  }

  @override
  saveFiveDayForecast(ForecastResponseEntity forecastResponseEntity) {
    final Box forecastBox = Hive.box<ForecastResponseEntity>(_kForecastListBox);
    return forecastBox.put('forecast', forecastResponseEntity);
  }



}
