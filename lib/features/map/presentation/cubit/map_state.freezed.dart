// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MockMapState {
  String get address;
  Offset get offset;
  bool get loading;

  /// Create a copy of MockMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MockMapStateCopyWith<MockMapState> get copyWith =>
      _$MockMapStateCopyWithImpl<MockMapState>(
          this as MockMapState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MockMapState &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, offset, loading);

  @override
  String toString() {
    return 'MockMapState(address: $address, offset: $offset, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class $MockMapStateCopyWith<$Res> {
  factory $MockMapStateCopyWith(
          MockMapState value, $Res Function(MockMapState) _then) =
      _$MockMapStateCopyWithImpl;
  @useResult
  $Res call({String address, Offset offset, bool loading});
}

/// @nodoc
class _$MockMapStateCopyWithImpl<$Res> implements $MockMapStateCopyWith<$Res> {
  _$MockMapStateCopyWithImpl(this._self, this._then);

  final MockMapState _self;
  final $Res Function(MockMapState) _then;

  /// Create a copy of MockMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? offset = null,
    Object? loading = null,
  }) {
    return _then(_self.copyWith(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [MockMapState].
extension MockMapStatePatterns on MockMapState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MockMapState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MockMapState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MockMapState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MockMapState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MockMapState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MockMapState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String address, Offset offset, bool loading)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MockMapState() when $default != null:
        return $default(_that.address, _that.offset, _that.loading);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String address, Offset offset, bool loading) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MockMapState():
        return $default(_that.address, _that.offset, _that.loading);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String address, Offset offset, bool loading)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MockMapState() when $default != null:
        return $default(_that.address, _that.offset, _that.loading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MockMapState implements MockMapState {
  const _MockMapState(
      {this.address = "",
      this.offset = const Offset(0, 0),
      this.loading = false});

  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final Offset offset;
  @override
  @JsonKey()
  final bool loading;

  /// Create a copy of MockMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MockMapStateCopyWith<_MockMapState> get copyWith =>
      __$MockMapStateCopyWithImpl<_MockMapState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MockMapState &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, offset, loading);

  @override
  String toString() {
    return 'MockMapState(address: $address, offset: $offset, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class _$MockMapStateCopyWith<$Res>
    implements $MockMapStateCopyWith<$Res> {
  factory _$MockMapStateCopyWith(
          _MockMapState value, $Res Function(_MockMapState) _then) =
      __$MockMapStateCopyWithImpl;
  @override
  @useResult
  $Res call({String address, Offset offset, bool loading});
}

/// @nodoc
class __$MockMapStateCopyWithImpl<$Res>
    implements _$MockMapStateCopyWith<$Res> {
  __$MockMapStateCopyWithImpl(this._self, this._then);

  final _MockMapState _self;
  final $Res Function(_MockMapState) _then;

  /// Create a copy of MockMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
    Object? offset = null,
    Object? loading = null,
  }) {
    return _then(_MockMapState(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
