import 'package:http/http.dart' as http;
import 'package:testapp/exceptions/weather_exception.dart';
import 'package:testapp/models/custom_error.dart';
import 'package:testapp/models/direct_geocoding.dart';
import 'package:testapp/services/weather_api_services.dart';

import '../models/weather.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;

  const WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> getWeather({required String cityName}) async {
    try {
      final DirectGeocoding directGeocoding =
          await weatherApiServices.getDirectGeocoding(cityName: cityName);

      final Weather tempWeather = await weatherApiServices.getWeatherData(
          directGeocoding: directGeocoding);

      final Weather weather = tempWeather.copyWith(
        name: directGeocoding.name,
        country: directGeocoding.country,
      );

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errorMessage: e.message);
    } catch (e) {
      throw CustomError(errorMessage: e.toString());
    }
  }
}
