// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  bool get isAuthenticated => throw _privateConstructorUsedError;
  String? get userEmail => throw _privateConstructorUsedError;
  List<String> get userRoles => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get userTenants =>
      throw _privateConstructorUsedError;
  String? get currentTenantKey => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {bool isAuthenticated,
      String? userEmail,
      List<String> userRoles,
      List<Map<String, dynamic>> userTenants,
      String? currentTenantKey,
      String? accessToken,
      String? refreshToken});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticated = null,
    Object? userEmail = freezed,
    Object? userRoles = null,
    Object? userTenants = null,
    Object? currentTenantKey = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      userRoles: null == userRoles
          ? _value.userRoles
          : userRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userTenants: null == userTenants
          ? _value.userTenants
          : userTenants // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      currentTenantKey: freezed == currentTenantKey
          ? _value.currentTenantKey
          : currentTenantKey // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAuthenticated,
      String? userEmail,
      List<String> userRoles,
      List<Map<String, dynamic>> userTenants,
      String? currentTenantKey,
      String? accessToken,
      String? refreshToken});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticated = null,
    Object? userEmail = freezed,
    Object? userRoles = null,
    Object? userTenants = null,
    Object? currentTenantKey = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$AuthStateImpl(
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      userRoles: null == userRoles
          ? _value._userRoles
          : userRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userTenants: null == userTenants
          ? _value._userTenants
          : userTenants // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      currentTenantKey: freezed == currentTenantKey
          ? _value.currentTenantKey
          : currentTenantKey // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.isAuthenticated = false,
      this.userEmail = null,
      final List<String> userRoles = const [],
      final List<Map<String, dynamic>> userTenants = const [],
      this.currentTenantKey = null,
      this.accessToken = null,
      this.refreshToken = null})
      : _userRoles = userRoles,
        _userTenants = userTenants;

  @override
  @JsonKey()
  final bool isAuthenticated;
  @override
  @JsonKey()
  final String? userEmail;
  final List<String> _userRoles;
  @override
  @JsonKey()
  List<String> get userRoles {
    if (_userRoles is EqualUnmodifiableListView) return _userRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userRoles);
  }

  final List<Map<String, dynamic>> _userTenants;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get userTenants {
    if (_userTenants is EqualUnmodifiableListView) return _userTenants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userTenants);
  }

  @override
  @JsonKey()
  final String? currentTenantKey;
  @override
  @JsonKey()
  final String? accessToken;
  @override
  @JsonKey()
  final String? refreshToken;

  @override
  String toString() {
    return 'AuthState(isAuthenticated: $isAuthenticated, userEmail: $userEmail, userRoles: $userRoles, userTenants: $userTenants, currentTenantKey: $currentTenantKey, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            const DeepCollectionEquality()
                .equals(other._userRoles, _userRoles) &&
            const DeepCollectionEquality()
                .equals(other._userTenants, _userTenants) &&
            (identical(other.currentTenantKey, currentTenantKey) ||
                other.currentTenantKey == currentTenantKey) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAuthenticated,
      userEmail,
      const DeepCollectionEquality().hash(_userRoles),
      const DeepCollectionEquality().hash(_userTenants),
      currentTenantKey,
      accessToken,
      refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final bool isAuthenticated,
      final String? userEmail,
      final List<String> userRoles,
      final List<Map<String, dynamic>> userTenants,
      final String? currentTenantKey,
      final String? accessToken,
      final String? refreshToken}) = _$AuthStateImpl;

  @override
  bool get isAuthenticated;
  @override
  String? get userEmail;
  @override
  List<String> get userRoles;
  @override
  List<Map<String, dynamic>> get userTenants;
  @override
  String? get currentTenantKey;
  @override
  String? get accessToken;
  @override
  String? get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
