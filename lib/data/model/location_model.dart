import 'package:sunshine/domain/entities/location.dart';

class LocationModel extends LocationEntity {
  const LocationModel(
      {required String name,
      required double lat,
      required double lon,
      required String country,
      String? state})
      : super(name: name, lat: lat, lon: lon, country: country, state: state);

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
      name: json['name'],
      lat: json['lat'],
      lon: json['lon'],
      country: json['country'],
      state: json['state']??"");

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lat'] = lat;
    data['lon'] = lon;
    data['country'] = country;
    data['state'] = state;
    return data;
  }

  LocationEntity toEntity() => LocationEntity(
      name: name, lat: lat, lon: lon, country: country, state: state);
}
