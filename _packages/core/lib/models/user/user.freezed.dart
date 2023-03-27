// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  Future<String?> Function([bool]) get getIdToken =>
      throw _privateConstructorUsedError;
  DateTime? get joinDate => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool get isEmailVerified => throw _privateConstructorUsedError;
  bool get isPhoneNumberVerified => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      Future<String?> Function([bool]) getIdToken,
      DateTime? joinDate,
      String? email,
      String? phoneNumber,
      bool isEmailVerified,
      bool isPhoneNumberVerified});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? getIdToken = null,
    Object? joinDate = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? isEmailVerified = null,
    Object? isPhoneNumberVerified = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      getIdToken: null == getIdToken
          ? _value.getIdToken
          : getIdToken // ignore: cast_nullable_to_non_nullable
              as Future<String?> Function([bool]),
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneNumberVerified: null == isPhoneNumberVerified
          ? _value.isPhoneNumberVerified
          : isPhoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Future<String?> Function([bool]) getIdToken,
      DateTime? joinDate,
      String? email,
      String? phoneNumber,
      bool isEmailVerified,
      bool isPhoneNumberVerified});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? getIdToken = null,
    Object? joinDate = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? isEmailVerified = null,
    Object? isPhoneNumberVerified = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      getIdToken: null == getIdToken
          ? _value.getIdToken
          : getIdToken // ignore: cast_nullable_to_non_nullable
              as Future<String?> Function([bool]),
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneNumberVerified: null == isPhoneNumberVerified
          ? _value.isPhoneNumberVerified
          : isPhoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_User extends _User {
  const _$_User(
      {required this.id,
      required this.getIdToken,
      this.joinDate,
      this.email,
      this.phoneNumber,
      this.isEmailVerified = false,
      this.isPhoneNumberVerified = false})
      : super._();

  @override
  final String id;
  @override
  final Future<String?> Function([bool]) getIdToken;
  @override
  final DateTime? joinDate;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  @JsonKey()
  final bool isEmailVerified;
  @override
  @JsonKey()
  final bool isPhoneNumberVerified;

  @override
  String toString() {
    return 'User(id: $id, getIdToken: $getIdToken, joinDate: $joinDate, email: $email, phoneNumber: $phoneNumber, isEmailVerified: $isEmailVerified, isPhoneNumberVerified: $isPhoneNumberVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.getIdToken, getIdToken) ||
                other.getIdToken == getIdToken) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.isPhoneNumberVerified, isPhoneNumberVerified) ||
                other.isPhoneNumberVerified == isPhoneNumberVerified));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, getIdToken, joinDate, email,
      phoneNumber, isEmailVerified, isPhoneNumberVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);
}

abstract class _User extends User {
  const factory _User(
      {required final String id,
      required final Future<String?> Function([bool]) getIdToken,
      final DateTime? joinDate,
      final String? email,
      final String? phoneNumber,
      final bool isEmailVerified,
      final bool isPhoneNumberVerified}) = _$_User;
  const _User._() : super._();

  @override
  String get id;
  @override
  Future<String?> Function([bool]) get getIdToken;
  @override
  DateTime? get joinDate;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  bool get isEmailVerified;
  @override
  bool get isPhoneNumberVerified;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
