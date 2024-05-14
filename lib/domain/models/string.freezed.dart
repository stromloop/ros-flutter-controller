// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'string.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RosString {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RosStringCopyWith<RosString> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RosStringCopyWith<$Res> {
  factory $RosStringCopyWith(RosString value, $Res Function(RosString) then) =
      _$RosStringCopyWithImpl<$Res, RosString>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$RosStringCopyWithImpl<$Res, $Val extends RosString>
    implements $RosStringCopyWith<$Res> {
  _$RosStringCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RosStringImplCopyWith<$Res>
    implements $RosStringCopyWith<$Res> {
  factory _$$RosStringImplCopyWith(
          _$RosStringImpl value, $Res Function(_$RosStringImpl) then) =
      __$$RosStringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$RosStringImplCopyWithImpl<$Res>
    extends _$RosStringCopyWithImpl<$Res, _$RosStringImpl>
    implements _$$RosStringImplCopyWith<$Res> {
  __$$RosStringImplCopyWithImpl(
      _$RosStringImpl _value, $Res Function(_$RosStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$RosStringImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RosStringImpl implements _RosString {
  const _$RosStringImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'RosString(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RosStringImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RosStringImplCopyWith<_$RosStringImpl> get copyWith =>
      __$$RosStringImplCopyWithImpl<_$RosStringImpl>(this, _$identity);
}

abstract class _RosString implements RosString {
  const factory _RosString({required final String name}) = _$RosStringImpl;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$RosStringImplCopyWith<_$RosStringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
