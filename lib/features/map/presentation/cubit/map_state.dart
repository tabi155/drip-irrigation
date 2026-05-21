import 'dart:ui' show Offset;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_state.freezed.dart';

@freezed
abstract class MockMapState with _$MockMapState {
  const factory MockMapState({
    @Default("") String address,
    @Default(Offset(0, 0)) Offset offset,
    @Default(false) bool loading,
  }) = _MockMapState;
}