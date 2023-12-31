

class Urls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';

  static const String baseGeoUrl = 'https://api.openweathermap.org/geo/1.0';

  static const String apiKey = "eead106b1353233969352419d94fb93e";

  static String currentWeatherByName(String city) =>
      '$baseUrl/weather?q=$city&units=metric&appid=$apiKey';

  static String searchCityListByName(String cityName) =>
      '$baseGeoUrl/direct?q=$cityName&limit=5&&appid=$apiKey';


  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}