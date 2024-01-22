import '../../domain/entities/forecast_entity.dart';

class ForecastResponseModel extends ForecastResponseEntity {
  const ForecastResponseModel(
      {required String code, required List<ForecastModel> list})
      : super(code: code, list: list);

  factory ForecastResponseModel.fromJson(Map<String, dynamic> json) =>
      ForecastResponseModel(
          list: (json['list'] as List<dynamic>?)!
              .map((e) => ForecastModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          code: json['cod']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cod': code,
        'list': list
            .map(
              (e) => {
                'weather': [
                  {'icon': e.iconCode}
                ],
                "wind": {
                  "speed": e.windSpeed,
                  "deg": e.windDegree,
                },
                'main': {'temp': e.temperature},
                'dt': e.dt,
              },
            )
            .toList()
      };

  ForecastResponseEntity toEntity() {
    List<ForecastEntity> entities = list.map((e) => e).toList();
    return ForecastResponseEntity(code: code, list: entities);
  }
}

class ForecastModel extends ForecastEntity {
  ForecastModel(
      {required String iconCode,
      required int dt,
      required double temperature,
      required double windSpeed,
      required int windDegree,
      String? date,
      String? day,
      String? hour})
      : super(
            iconCode: iconCode,
            dt: dt,
            temperature: temperature,
            windDegree: windDegree,
            windSpeed: windSpeed,
            date: date,
      hour: hour,
            day: day);

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
      iconCode: json['weather'][0]['icon'],
      temperature: json['main']['temp'].runtimeType == int
          ? (json['main']['temp'] as int).toDouble()
          : json['main']['temp'],
      windDegree: json['wind']['deg'],
      windSpeed: json['wind']['speed'].runtimeType == int
          ? (json['wind']['speed'] as int).toDouble()
          : json['wind']['speed'],
      dt: json['dt']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'weather': [
          {
            'icon': iconCode,
          },
        ],
        "wind": {
          "speed": windSpeed,
          "deg": windDegree,
        },
        'main': {
          'temp': temperature,
        },
        'dt': dt
      };

  ForecastEntity toEntity() => ForecastModel(
      iconCode: iconCode,
      temperature: temperature,
      windDegree: windDegree,
      windSpeed: windSpeed,
      dt: dt,
      date: date,
      day: day);
}
