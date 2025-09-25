// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  @JsonKey(name: 'access_token')
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String? get refreshToken => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenant')
  Map<String, dynamic>? get tenant => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiresAt')
  String? get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String token,
      @JsonKey(name: 'refresh_token') String? refreshToken,
      User user,
      @JsonKey(name: 'tenant') Map<String, dynamic>? tenant,
      @JsonKey(name: 'expiresAt') String? expiresAt});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = freezed,
    Object? user = null,
    Object? tenant = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      tenant: freezed == tenant
          ? _value.tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String token,
      @JsonKey(name: 'refresh_token') String? refreshToken,
      User user,
      @JsonKey(name: 'tenant') Map<String, dynamic>? tenant,
      @JsonKey(name: 'expiresAt') String? expiresAt});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = freezed,
    Object? user = null,
    Object? tenant = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_$LoginResponseImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      tenant: freezed == tenant
          ? _value._tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl(
      {@JsonKey(name: 'access_token') required this.token,
      @JsonKey(name: 'refresh_token') this.refreshToken,
      required this.user,
      @JsonKey(name: 'tenant') final Map<String, dynamic>? tenant,
      @JsonKey(name: 'expiresAt') this.expiresAt})
      : _tenant = tenant;

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String token;
  @override
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @override
  final User user;
  final Map<String, dynamic>? _tenant;
  @override
  @JsonKey(name: 'tenant')
  Map<String, dynamic>? get tenant {
    final value = _tenant;
    if (value == null) return null;
    if (_tenant is EqualUnmodifiableMapView) return _tenant;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'expiresAt')
  final String? expiresAt;

  @override
  String toString() {
    return 'LoginResponse(token: $token, refreshToken: $refreshToken, user: $user, tenant: $tenant, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._tenant, _tenant) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, refreshToken, user,
      const DeepCollectionEquality().hash(_tenant), expiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
          {@JsonKey(name: 'access_token') required final String token,
          @JsonKey(name: 'refresh_token') final String? refreshToken,
          required final User user,
          @JsonKey(name: 'tenant') final Map<String, dynamic>? tenant,
          @JsonKey(name: 'expiresAt') final String? expiresAt}) =
      _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get token;
  @override
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;
  @override
  User get user;
  @override
  @JsonKey(name: 'tenant')
  Map<String, dynamic>? get tenant;
  @override
  @JsonKey(name: 'expiresAt')
  String? get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
