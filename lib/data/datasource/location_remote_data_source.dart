import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:sunshine/data/model/location_model.dart';

import '../../core/constants.dart';
import '../../core/error/exception.dart';

abstract class LocationRemoteDataSource {
  Future<List<LocationModel>> searchCityListByName(String cityName);
}

class LocationRemoteDataSourceImpl extends LocationRemoteDataSource {
  final http.Client client;
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  LocationRemoteDataSourceImpl({required this.client});

  @override
  Future<List<LocationModel>> searchCityListByName(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.searchCityListByName(cityName)));
    if (response.statusCode == 200) {
      logger.i(response.body);

      List<dynamic> result = json.decode(response.body);

      var locations = result.map((e) => LocationModel.fromJson(e)).toList();

      return locations;
    } else {
      logger.e(response.body, error: response);
      var result = json.decode(response.body);
      throw ServerException(message: result['message']);
    }
  }
}
