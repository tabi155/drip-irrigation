import 'package:movie_diss/features/home/data/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel weather;

  WeatherSuccess(this.weather);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
