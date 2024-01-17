import 'package:json_annotation/json_annotation.dart';
import 'package:sunshine/data/model/forecast_model.dart';
import 'package:sunshine/domain/entities/five_day_forecast_entity.dart';
import 'package:sunshine/domain/entities/forecast_entity.dart';

class FiveDayForecastModel extends FiveDayForecastEntity {
  const FiveDayForecastModel(
      {required String code, required List<ForecastModel> list})
      : super(code: code, list: list);

  factory FiveDayForecastModel.fromJson(Map<String, dynamic> json) =>
      FiveDayForecastModel(
          list: (json['list'] as List<dynamic>?)!
              .map((e) => ForecastModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          code: json['cod']);

  Map<String, dynamic> toJson() => <String, dynamic>{'cod': code, 'list': list};

  FiveDayForecastEntity toEntity() {
    List<ForecastEntity> entities = list.map((e) => e).toList();
    return FiveDayForecastEntity(code: code, list: entities);
  }
}
