import 'package:sunshine/domain/entities/air_pollution_entity.dart';

class AirPollutionResponseModel extends AirPollutionResponseEntity {
  const AirPollutionResponseModel({
    required List<AirPollutionModel> list,
  }) : super(list: list);

  factory AirPollutionResponseModel.fromJson(Map<String, dynamic> json) =>
      AirPollutionResponseModel(
        list: (json['list'] as List<dynamic>?)!
            .map((e) => AirPollutionModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'list': list
            .map(
              (e) => {
                'main': {'aqi': e.aqi},
                "components": {
                  "no2": e.no2,
                  "o3": e.o3,
                  "so2": e.so2,
                  "pm2_5": e.pm2_5,
                },
                "dt": e.dt
              },
            )
            .toList()
      };

  AirPollutionResponseEntity toEntity() {
    return AirPollutionResponseEntity(
      list: list,
    );
  }
}

class AirPollutionModel extends AirPollutionEntity {
  const AirPollutionModel(
      {required int aqi,
      required double no2,
      required double o3,
      required double so2,
      required double pm2_5,
      required int dt})
      : super(aqi: aqi, no2: no2, o3: o3, so2: so2, pm2_5: pm2_5, dt: dt);

  factory AirPollutionModel.fromJson(Map<String, dynamic> json) =>
      AirPollutionModel(
          aqi: json['main']['aqi'],
          no2: json['components']['no2'],
          o3: json['components']['o3'],
          so2: json['components']['so2'],
          pm2_5: json['components']['pm2_5'],
          dt: json['dt']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        "main": {"aqi": aqi},
        "components": {
          "no2": no2,
          "o3": o3,
          "so2": so2,
          "pm2_5": pm2_5,
        },
        "dt": dt
      };

  AirPollutionEntity toEntity() {
    return AirPollutionEntity(
        no2: no2, o3: o3, so2: so2, pm2_5: pm2_5, aqi: aqi, dt: dt);
  }
}
