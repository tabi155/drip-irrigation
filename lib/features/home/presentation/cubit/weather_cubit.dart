import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_diss/features/home/domain/weather_interactor.dart';

import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherInteractor interactor;

  WeatherCubit(this.interactor) : super(WeatherInitial());

  Future<void> loadWeather() async {
    emit(WeatherLoading());

    try {
      final weather = await interactor.getWeather();

      emit(WeatherSuccess(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
