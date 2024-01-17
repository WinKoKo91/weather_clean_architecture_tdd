import '../../domain/entities/forecast_entity.dart';

class ForecastModel extends ForecastEntity {
   ForecastModel(
      {required String iconCode,
      required int dt,
      required double temperature,
      String? date,
      String? day})
      : super(
            iconCode: iconCode,
            dt: dt,
            temperature: temperature,
            date: date,
            day: day);

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
      iconCode: json['weather'][0]['icon'],
      temperature: json['main']['temp'].runtimeType == int
          ? (json['main']['temp'] as int).toDouble()
          : json['main']['temp'],
      dt: json['dt']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'weather': [
          {
            'icon': iconCode,
          },
        ],
        'main': {
          'temp': temperature,
        },
        'dt': dt
      };

  ForecastEntity toEntity() => ForecastModel(
      iconCode: iconCode,
      temperature: temperature,
      dt: dt,
      date: date,
      day: day);
}
