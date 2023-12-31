import '../../domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel(
      {required String cityName,
      required String main,
      required String description,
      required String iconCode,
      required double temperature,
      required int pressure,
      required int humidity,
      required String country,
      required int dt})
      : super(
            cityName: cityName,
            country: country,
            main: main,
            description: description,
            iconCode: iconCode,
            temperature: temperature,
            pressure: pressure,
            humidity: humidity,
            dt: dt);

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        temperature: json['main']['temp'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        country: json['sys']['country'],
        dt: json['dt'],
      );

  Map<String, dynamic> toJson() => {
        'weather': [
          {
            'main': main,
            'description': description,
            'icon': iconCode,
          },
        ],
        'main': {
          'temp': temperature,
          'pressure': pressure,
          'humidity': humidity,
        },
        'sys': {'country': country},
        'name': cityName,
        'dt': dt
      };

  WeatherEntity toEntity() => WeatherEntity(
        cityName: cityName,
        main: main,
        description: description,
        iconCode: iconCode,
        temperature: temperature,
        pressure: pressure,
        humidity: humidity,
        dt: dt,
        country: country,
      );
}
