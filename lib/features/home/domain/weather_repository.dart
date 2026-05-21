import 'package:movie_diss/features/home/data/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather();
}
