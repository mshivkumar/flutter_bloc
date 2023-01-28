import 'package:equatable/equatable.dart';

class DirectGeocoding extends Equatable {
  final String name;
  final double lat;
  final double lon;
  final String country;

  const DirectGeocoding({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  @override
  String toString() {
    return 'DirectGeocoding{name: $name, lat: $lat, lon: $lon, country: $country}';
  }

  @override
  List<Object> get props => [name, lat, lon, country];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lat': lat,
      'lon': lon,
      'country': country,
    };
  }

  factory DirectGeocoding.fromMap(List<dynamic> json) {
    final Map<String, dynamic> data = json[0];
    return DirectGeocoding(
      name: data['name'] as String,
      lat: data['lat'] as double,
      lon: data['lon'] as double,
      country: data['country'] as String,
    );
  }
}
