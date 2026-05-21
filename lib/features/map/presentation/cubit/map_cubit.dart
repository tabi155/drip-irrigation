import 'dart:async';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'map_state.dart';

class MockMapCubit extends Cubit<MockMapState> {
  MockMapCubit() : super(const MockMapState());

  final Map<String, Offset> fakeDatabase = {
    "Bishkek": const Offset(120, 220),
    "Osh": const Offset(200, 400),
    "Almaty": const Offset(260, 180),
    "Tokmok": const Offset(80, 300),
  };

  void searchAddress(String query) {
    emit(state.copyWith(loading: true));

    Future.delayed(const Duration(milliseconds: 500), () {
      final result = fakeDatabase[query];

      if (result != null) {
        emit(state.copyWith(
          address: query,
          offset: result,
          loading: false,
        ));
      } else {
        emit(state.copyWith(
          address: "Not found",
          loading: false,
        ));
      }
    });
  }

  void moveMarker(Offset delta) {
    emit(state.copyWith(
      offset: state.offset + delta,
    ));
  }
}
