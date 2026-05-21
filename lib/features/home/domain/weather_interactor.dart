import 'package:movie_diss/features/home/data/weather_model.dart';
import 'package:movie_diss/features/home/domain/weather_repository.dart';

class WeatherInteractor {
  final WeatherRepository repository;

  WeatherInteractor(this.repository);

  Future<WeatherModel> getWeather() {
    return repository.getWeather();
  }
}
