import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_diss/features/home/data/weather_model.dart';
import 'package:movie_diss/features/home/domain/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  static const String _apiKey = "80e6832e445f4bea36dc553fd6f580a0";

  static const double _lat = 42.8746;
  static const double _lon = 74.5698;

  @override
  Future<WeatherModel> getWeather() async {
    const url = "https://api.openweathermap.org/data/2.5/weather"
        "?lat=$_lat"
        "&lon=$_lon"
        "&units=metric"
        "&exclude=minutely,hourly,daily,alerts"
        "&appid=$_apiKey";

    final response = await http.get(Uri.parse(url));
    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception("Failed to load weather");
    }

    final data = jsonDecode(response.body);

    return WeatherModel.fromJson(data);
  }
}
