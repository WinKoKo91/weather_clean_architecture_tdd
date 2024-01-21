import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<Position> getCurrentLocation() async {
    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      bool result = await location.requestService();
      if (result == true) {
        print('Service has been enabled');
      } else {
        throw Exception('GPS service not enabled');
      }
    }

    try {
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
