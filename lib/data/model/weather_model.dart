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
      required double lon,
      required double lat,
      required double feelsLike,
      required int visibility,
      required int sunrise,
      required int sunset,
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
            lon: lon,
            lat: lat,
            sunrise: sunrise,
            sunset: sunset,
            visibility: visibility,
            feelsLike: feelsLike,
            dt: dt);

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        temperature: (json['main']['temp'] as num).toDouble(),
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        feelsLike:( json['main']['feels_like'] as num).toDouble(),
        visibility: json['visibility'],
        country: json['sys']['country'],
        lon: json['coord']['lon'],
        lat: json['coord']['lat'],
        sunset: json['sys']['sunset'],
        sunrise: json['sys']['sunrise'],
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
          "feels_like": feelsLike,
        },
        "visibility": visibility,
        "coord": {"lon": lon, "lat": lat},
        'sys': {'country': country, "sunrise": sunrise, "sunset": sunset},
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
      lon: lon,
      lat: lat,
      country: country,
      sunrise: sunrise,
      sunset: sunset,
      feelsLike: feelsLike,
      visibility: visibility);
}
