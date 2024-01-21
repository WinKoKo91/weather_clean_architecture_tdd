class Urls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';

  static const String baseGeoUrl = 'https://api.openweathermap.org/geo/1.0';

  static const String apiKey = "eead106b1353233969352419d94fb93e";

  static String getCurrentWeatherByName(String city) =>
      '$baseUrl/weather?q=$city&units=metric&appid=$apiKey';

  static String getCurrentWeatherByLocation(double lat, double long) =>
      '$baseUrl/weather?lat=$lat&lon=$long&units=metric&appid=$apiKey';

  static String getFiveDayForecast(
          {required double lat, required double lon}) =>
      '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=$apiKey';

  static String getAirPollution({required double lat, required double lon}) =>
      '$baseUrl/air_pollution?lat=$lat&lon=$lon&appid=$apiKey';

  static String getReverseGeo({required double lat, required double lon}) =>
      '$baseGeoUrl/reverse?lat=$lat&lon=$lon&limit=5&appid=$apiKey';

  static String searchCityListByName(String cityName) =>
      '$baseGeoUrl/direct?q=$cityName&limit=5&&appid=$apiKey';

  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}
