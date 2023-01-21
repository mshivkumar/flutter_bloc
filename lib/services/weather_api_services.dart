import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/constants/constants.dart';
import 'package:testapp/exceptions/weather_exception.dart';

import '../models/direct_geocoding.dart';
import '../models/weather.dart';
import 'http_error_handler.dart';

class WeatherApiServices {
  final http.Client httpClient;

  const WeatherApiServices({
    required this.httpClient,
  });

  Future<DirectGeocoding> getDirectGeocoding({required String cityName}) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/geo/1.0/direct',
        queryParameters: {
          'q': cityName,
          'limit': kLimit,
          'appid': dotenv.env['APPID']
        });

    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != 200) {
        throw httpErrorHandler(response: response);
      }

      final List<Map<String, dynamic>> responseBody =
          json.decode(response.body);

      if (responseBody.isEmpty) {
        throw WeatherException('Cannot get the location of the $cityName');
      }

      final directGeocoding = DirectGeocoding.fromMap(responseBody);
      return directGeocoding;
    } catch (e) {
      rethrow;
    }
  }

  Future<Weather> getWeatherData(
      {required DirectGeocoding directGeocoding}) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/data/2.5/weather',
        queryParameters: {
          'lat': '${directGeocoding.lat}',
          'lon': '${directGeocoding.lon}',
          'units': kUnit,
          'appid': dotenv.env['APPID'],
        });

    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != 200) {
        throw httpErrorHandler(response: response);
      }

      final Map<String, dynamic> responseBody = json.decode(response.body);

      final Weather weather = Weather.fromMap(responseBody);
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
