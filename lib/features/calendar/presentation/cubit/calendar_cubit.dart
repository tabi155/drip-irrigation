import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_diss/core/storage/watering_storage.dart';
import 'package:movie_diss/features/calendar/presentation/cubit/calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  Timer? _timer;

  CalendarCubit()
      : super(CalendarState(
          data: {},
          selectedZone: "zone1",
          autoMode: false,
        )) {
    load();
  }

  Future<void> load() async {
    final data = await WateringStorage.getAll();
    emit(state.copyWith(data: data));
  }

  void selectZone(String zoneId) {
    emit(state.copyWith(selectedZone: zoneId));
  }

  Future<void> toggleDate(String date) async {
    await WateringStorage.toggle(state.selectedZone, date);
    await load();
  }

  void toggleAutoMode(bool value) {
    emit(state.copyWith(autoMode: value));

    if (value) {
      _startAuto();
    } else {
      _timer?.cancel();
    }
  }

  void _startAuto() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      final today = DateTime.now();
      final date = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

      final list = state.data[state.selectedZone] ?? [];

      if (list.contains(date)) {
        print("🚿 AUTO WATERING: ${state.selectedZone}");

        // “уведомление”
        print("🔔 ПОЛИВ ВЫПОЛНЕН (MOCK)");
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
