// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminTenant _$AdminTenantFromJson(Map<String, dynamic> json) {
  return _AdminTenant.fromJson(json);
}

/// @nodoc
mixin _$AdminTenant {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'external_key')
  String? get externalKey => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'users_count')
  int? get usersCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminTenantCopyWith<AdminTenant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminTenantCopyWith<$Res> {
  factory $AdminTenantCopyWith(
          AdminTenant value, $Res Function(AdminTenant) then) =
      _$AdminTenantCopyWithImpl<$Res, AdminTenant>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'external_key') String? externalKey,
      String status,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'users_count') int? usersCount});
}

/// @nodoc
class _$AdminTenantCopyWithImpl<$Res, $Val extends AdminTenant>
    implements $AdminTenantCopyWith<$Res> {
  _$AdminTenantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? externalKey = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? usersCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalKey: freezed == externalKey
          ? _value.externalKey
          : externalKey // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usersCount: freezed == usersCount
          ? _value.usersCount
          : usersCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminTenantImplCopyWith<$Res>
    implements $AdminTenantCopyWith<$Res> {
  factory _$$AdminTenantImplCopyWith(
          _$AdminTenantImpl value, $Res Function(_$AdminTenantImpl) then) =
      __$$AdminTenantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'external_key') String? externalKey,
      String status,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'users_count') int? usersCount});
}

/// @nodoc
class __$$AdminTenantImplCopyWithImpl<$Res>
    extends _$AdminTenantCopyWithImpl<$Res, _$AdminTenantImpl>
    implements _$$AdminTenantImplCopyWith<$Res> {
  __$$AdminTenantImplCopyWithImpl(
      _$AdminTenantImpl _value, $Res Function(_$AdminTenantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? externalKey = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? usersCount = freezed,
  }) {
    return _then(_$AdminTenantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalKey: freezed == externalKey
          ? _value.externalKey
          : externalKey // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usersCount: freezed == usersCount
          ? _value.usersCount
          : usersCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminTenantImpl implements _AdminTenant {
  const _$AdminTenantImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'external_key') this.externalKey,
      this.status = 'active',
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'users_count') this.usersCount});

  factory _$AdminTenantImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminTenantImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'external_key')
  final String? externalKey;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'users_count')
  final int? usersCount;

  @override
  String toString() {
    return 'AdminTenant(id: $id, name: $name, externalKey: $externalKey, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, usersCount: $usersCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminTenantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.externalKey, externalKey) ||
                other.externalKey == externalKey) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.usersCount, usersCount) ||
                other.usersCount == usersCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, externalKey, status,
      createdAt, updatedAt, usersCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminTenantImplCopyWith<_$AdminTenantImpl> get copyWith =>
      __$$AdminTenantImplCopyWithImpl<_$AdminTenantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminTenantImplToJson(
      this,
    );
  }
}

abstract class _AdminTenant implements AdminTenant {
  const factory _AdminTenant(
      {required final int id,
      required final String name,
      @JsonKey(name: 'external_key') final String? externalKey,
      final String status,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'users_count') final int? usersCount}) = _$AdminTenantImpl;

  factory _AdminTenant.fromJson(Map<String, dynamic> json) =
      _$AdminTenantImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'external_key')
  String? get externalKey;
  @override
  String get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'users_count')
  int? get usersCount;
  @override
  @JsonKey(ignore: true)
  _$$AdminTenantImplCopyWith<_$AdminTenantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTenantRequest _$CreateTenantRequestFromJson(Map<String, dynamic> json) {
  return _CreateTenantRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateTenantRequest {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'external_key')
  String? get externalKey => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTenantRequestCopyWith<CreateTenantRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTenantRequestCopyWith<$Res> {
  factory $CreateTenantRequestCopyWith(
          CreateTenantRequest value, $Res Function(CreateTenantRequest) then) =
      _$CreateTenantRequestCopyWithImpl<$Res, CreateTenantRequest>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'external_key') String? externalKey,
      String status});
}

/// @nodoc
class _$CreateTenantRequestCopyWithImpl<$Res, $Val extends CreateTenantRequest>
    implements $CreateTenantRequestCopyWith<$Res> {
  _$CreateTenantRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? externalKey = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalKey: freezed == externalKey
          ? _value.externalKey
          : externalKey // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTenantRequestImplCopyWith<$Res>
    implements $CreateTenantRequestCopyWith<$Res> {
  factory _$$CreateTenantRequestImplCopyWith(_$CreateTenantRequestImpl value,
          $Res Function(_$CreateTenantRequestImpl) then) =
      __$$CreateTenantRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'external_key') String? externalKey,
      String status});
}

/// @nodoc
class __$$CreateTenantRequestImplCopyWithImpl<$Res>
    extends _$CreateTenantRequestCopyWithImpl<$Res, _$CreateTenantRequestImpl>
    implements _$$CreateTenantRequestImplCopyWith<$Res> {
  __$$CreateTenantRequestImplCopyWithImpl(_$CreateTenantRequestImpl _value,
      $Res Function(_$CreateTenantRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? externalKey = freezed,
    Object? status = null,
  }) {
    return _then(_$CreateTenantRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalKey: freezed == externalKey
          ? _value.externalKey
          : externalKey // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTenantRequestImpl implements _CreateTenantRequest {
  const _$CreateTenantRequestImpl(
      {required this.name,
      @JsonKey(name: 'external_key') this.externalKey,
      this.status = 'active'});

  factory _$CreateTenantRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTenantRequestImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'external_key')
  final String? externalKey;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'CreateTenantRequest(name: $name, externalKey: $externalKey, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTenantRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.externalKey, externalKey) ||
                other.externalKey == externalKey) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, externalKey, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTenantRequestImplCopyWith<_$CreateTenantRequestImpl> get copyWith =>
      __$$CreateTenantRequestImplCopyWithImpl<_$CreateTenantRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTenantRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateTenantRequest implements CreateTenantRequest {
  const factory _CreateTenantRequest(
      {required final String name,
      @JsonKey(name: 'external_key') final String? externalKey,
      final String status}) = _$CreateTenantRequestImpl;

  factory _CreateTenantRequest.fromJson(Map<String, dynamic> json) =
      _$CreateTenantRequestImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'external_key')
  String? get externalKey;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$CreateTenantRequestImplCopyWith<_$CreateTenantRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdminUser _$AdminUserFromJson(Map<String, dynamic> json) {
  return _AdminUser.fromJson(json);
}

/// @nodoc
mixin _$AdminUser {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<String> get roles => throw _privateConstructorUsedError;
  List<AdminTenant> get tenants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminUserCopyWith<AdminUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminUserCopyWith<$Res> {
  factory $AdminUserCopyWith(AdminUser value, $Res Function(AdminUser) then) =
      _$AdminUserCopyWithImpl<$Res, AdminUser>;
  @useResult
  $Res call(
      {int id,
      String email,
      @JsonKey(name: 'display_name') String? displayName,
      String? username,
      bool active,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      List<String> roles,
      List<AdminTenant> tenants});
}

/// @nodoc
class _$AdminUserCopyWithImpl<$Res, $Val extends AdminUser>
    implements $AdminUserCopyWith<$Res> {
  _$AdminUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? username = freezed,
    Object? active = null,
    Object? emailVerifiedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? roles = null,
    Object? tenants = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tenants: null == tenants
          ? _value.tenants
          : tenants // ignore: cast_nullable_to_non_nullable
              as List<AdminTenant>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminUserImplCopyWith<$Res>
    implements $AdminUserCopyWith<$Res> {
  factory _$$AdminUserImplCopyWith(
          _$AdminUserImpl value, $Res Function(_$AdminUserImpl) then) =
      __$$AdminUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      @JsonKey(name: 'display_name') String? displayName,
      String? username,
      bool active,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      List<String> roles,
      List<AdminTenant> tenants});
}

/// @nodoc
class __$$AdminUserImplCopyWithImpl<$Res>
    extends _$AdminUserCopyWithImpl<$Res, _$AdminUserImpl>
    implements _$$AdminUserImplCopyWith<$Res> {
  __$$AdminUserImplCopyWithImpl(
      _$AdminUserImpl _value, $Res Function(_$AdminUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? username = freezed,
    Object? active = null,
    Object? emailVerifiedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? roles = null,
    Object? tenants = null,
  }) {
    return _then(_$AdminUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tenants: null == tenants
          ? _value._tenants
          : tenants // ignore: cast_nullable_to_non_nullable
              as List<AdminTenant>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminUserImpl implements _AdminUser {
  const _$AdminUserImpl(
      {required this.id,
      required this.email,
      @JsonKey(name: 'display_name') this.displayName,
      this.username,
      this.active = true,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      final List<String> roles = const [],
      final List<AdminTenant> tenants = const []})
      : _roles = roles,
        _tenants = tenants;

  factory _$AdminUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminUserImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  final String? username;
  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey(name: 'email_verified_at')
  final DateTime? emailVerifiedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final List<String> _roles;
  @override
  @JsonKey()
  List<String> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  final List<AdminTenant> _tenants;
  @override
  @JsonKey()
  List<AdminTenant> get tenants {
    if (_tenants is EqualUnmodifiableListView) return _tenants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenants);
  }

  @override
  String toString() {
    return 'AdminUser(id: $id, email: $email, displayName: $displayName, username: $username, active: $active, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt, roles: $roles, tenants: $tenants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            const DeepCollectionEquality().equals(other._tenants, _tenants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      displayName,
      username,
      active,
      emailVerifiedAt,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_roles),
      const DeepCollectionEquality().hash(_tenants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminUserImplCopyWith<_$AdminUserImpl> get copyWith =>
      __$$AdminUserImplCopyWithImpl<_$AdminUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminUserImplToJson(
      this,
    );
  }
}

abstract class _AdminUser implements AdminUser {
  const factory _AdminUser(
      {required final int id,
      required final String email,
      @JsonKey(name: 'display_name') final String? displayName,
      final String? username,
      final bool active,
      @JsonKey(name: 'email_verified_at') final DateTime? emailVerifiedAt,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final List<String> roles,
      final List<AdminTenant> tenants}) = _$AdminUserImpl;

  factory _AdminUser.fromJson(Map<String, dynamic> json) =
      _$AdminUserImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  String? get username;
  @override
  bool get active;
  @override
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  List<String> get roles;
  @override
  List<AdminTenant> get tenants;
  @override
  @JsonKey(ignore: true)
  _$$AdminUserImplCopyWith<_$AdminUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) {
  return _CreateUserRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateUserRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateUserRequestCopyWith<CreateUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserRequestCopyWith<$Res> {
  factory $CreateUserRequestCopyWith(
          CreateUserRequest value, $Res Function(CreateUserRequest) then) =
      _$CreateUserRequestCopyWithImpl<$Res, CreateUserRequest>;
  @useResult
  $Res call(
      {String email,
      String password,
      @JsonKey(name: 'display_name') String? displayName,
      String? username,
      bool active});
}

/// @nodoc
class _$CreateUserRequestCopyWithImpl<$Res, $Val extends CreateUserRequest>
    implements $CreateUserRequestCopyWith<$Res> {
  _$CreateUserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = freezed,
    Object? username = freezed,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateUserRequestImplCopyWith<$Res>
    implements $CreateUserRequestCopyWith<$Res> {
  factory _$$CreateUserRequestImplCopyWith(_$CreateUserRequestImpl value,
          $Res Function(_$CreateUserRequestImpl) then) =
      __$$CreateUserRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      @JsonKey(name: 'display_name') String? displayName,
      String? username,
      bool active});
}

/// @nodoc
class __$$CreateUserRequestImplCopyWithImpl<$Res>
    extends _$CreateUserRequestCopyWithImpl<$Res, _$CreateUserRequestImpl>
    implements _$$CreateUserRequestImplCopyWith<$Res> {
  __$$CreateUserRequestImplCopyWithImpl(_$CreateUserRequestImpl _value,
      $Res Function(_$CreateUserRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = freezed,
    Object? username = freezed,
    Object? active = null,
  }) {
    return _then(_$CreateUserRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateUserRequestImpl implements _CreateUserRequest {
  const _$CreateUserRequestImpl(
      {required this.email,
      required this.password,
      @JsonKey(name: 'display_name') this.displayName,
      this.username,
      this.active = true});

  factory _$CreateUserRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateUserRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  final String? username;
  @override
  @JsonKey()
  final bool active;

  @override
  String toString() {
    return 'CreateUserRequest(email: $email, password: $password, displayName: $displayName, username: $username, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, displayName, username, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserRequestImplCopyWith<_$CreateUserRequestImpl> get copyWith =>
      __$$CreateUserRequestImplCopyWithImpl<_$CreateUserRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateUserRequest implements CreateUserRequest {
  const factory _CreateUserRequest(
      {required final String email,
      required final String password,
      @JsonKey(name: 'display_name') final String? displayName,
      final String? username,
      final bool active}) = _$CreateUserRequestImpl;

  factory _CreateUserRequest.fromJson(Map<String, dynamic> json) =
      _$CreateUserRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  String? get username;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$CreateUserRequestImplCopyWith<_$CreateUserRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) {
  return _UpdateUserRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserRequest {
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateUserRequestCopyWith<UpdateUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserRequestCopyWith<$Res> {
  factory $UpdateUserRequestCopyWith(
          UpdateUserRequest value, $Res Function(UpdateUserRequest) then) =
      _$UpdateUserRequestCopyWithImpl<$Res, UpdateUserRequest>;
  @useResult
  $Res call(
      {String? email,
      String? password,
      @JsonKey(name: 'display_name') String? displayName,
      String? username,
      bool? active});
}

/// @nodoc
class _$UpdateUserRequestCopyWithImpl<$Res, $Val extends UpdateUserRequest>
    implements $UpdateUserRequestCopyWith<$Res> {
  _$UpdateUserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? displayName = freezed,
    Object? username = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUserRequestImplCopyWith<$Res>
    implements $UpdateUserRequestCopyWith<$Res> {
  factory _$$UpdateUserRequestImplCopyWith(_$UpdateUserRequestImpl value,
          $Res Function(_$UpdateUserRequestImpl) then) =
      __$$UpdateUserRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? password,
      @JsonKey(name: 'display_name') String? displayName,
      String? username,
      bool? active});
}

/// @nodoc
class __$$UpdateUserRequestImplCopyWithImpl<$Res>
    extends _$UpdateUserRequestCopyWithImpl<$Res, _$UpdateUserRequestImpl>
    implements _$$UpdateUserRequestImplCopyWith<$Res> {
  __$$UpdateUserRequestImplCopyWithImpl(_$UpdateUserRequestImpl _value,
      $Res Function(_$UpdateUserRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? displayName = freezed,
    Object? username = freezed,
    Object? active = freezed,
  }) {
    return _then(_$UpdateUserRequestImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUserRequestImpl implements _UpdateUserRequest {
  const _$UpdateUserRequestImpl(
      {this.email,
      this.password,
      @JsonKey(name: 'display_name') this.displayName,
      this.username,
      this.active});

  factory _$UpdateUserRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserRequestImplFromJson(json);

  @override
  final String? email;
  @override
  final String? password;
  @override
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  final String? username;
  @override
  final bool? active;

  @override
  String toString() {
    return 'UpdateUserRequest(email: $email, password: $password, displayName: $displayName, username: $username, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, displayName, username, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserRequestImplCopyWith<_$UpdateUserRequestImpl> get copyWith =>
      __$$UpdateUserRequestImplCopyWithImpl<_$UpdateUserRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateUserRequest implements UpdateUserRequest {
  const factory _UpdateUserRequest(
      {final String? email,
      final String? password,
      @JsonKey(name: 'display_name') final String? displayName,
      final String? username,
      final bool? active}) = _$UpdateUserRequestImpl;

  factory _UpdateUserRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateUserRequestImpl.fromJson;

  @override
  String? get email;
  @override
  String? get password;
  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  String? get username;
  @override
  bool? get active;
  @override
  @JsonKey(ignore: true)
  _$$UpdateUserRequestImplCopyWith<_$UpdateUserRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Role _$RoleFromJson(Map<String, dynamic> json) {
  return _Role.fromJson(json);
}

/// @nodoc
mixin _$Role {
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get permissions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleCopyWith<Role> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res, Role>;
  @useResult
  $Res call(
      {String name,
      String displayName,
      String? description,
      List<String> permissions});
}

/// @nodoc
class _$RoleCopyWithImpl<$Res, $Val extends Role>
    implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? displayName = null,
    Object? description = freezed,
    Object? permissions = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleImplCopyWith<$Res> implements $RoleCopyWith<$Res> {
  factory _$$RoleImplCopyWith(
          _$RoleImpl value, $Res Function(_$RoleImpl) then) =
      __$$RoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String displayName,
      String? description,
      List<String> permissions});
}

/// @nodoc
class __$$RoleImplCopyWithImpl<$Res>
    extends _$RoleCopyWithImpl<$Res, _$RoleImpl>
    implements _$$RoleImplCopyWith<$Res> {
  __$$RoleImplCopyWithImpl(_$RoleImpl _value, $Res Function(_$RoleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? displayName = null,
    Object? description = freezed,
    Object? permissions = null,
  }) {
    return _then(_$RoleImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleImpl implements _Role {
  const _$RoleImpl(
      {required this.name,
      required this.displayName,
      this.description,
      final List<String> permissions = const []})
      : _permissions = permissions;

  factory _$RoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleImplFromJson(json);

  @override
  final String name;
  @override
  final String displayName;
  @override
  final String? description;
  final List<String> _permissions;
  @override
  @JsonKey()
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  String toString() {
    return 'Role(name: $name, displayName: $displayName, description: $description, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, displayName, description,
      const DeepCollectionEquality().hash(_permissions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleImplCopyWith<_$RoleImpl> get copyWith =>
      __$$RoleImplCopyWithImpl<_$RoleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleImplToJson(
      this,
    );
  }
}

abstract class _Role implements Role {
  const factory _Role(
      {required final String name,
      required final String displayName,
      final String? description,
      final List<String> permissions}) = _$RoleImpl;

  factory _Role.fromJson(Map<String, dynamic> json) = _$RoleImpl.fromJson;

  @override
  String get name;
  @override
  String get displayName;
  @override
  String? get description;
  @override
  List<String> get permissions;
  @override
  @JsonKey(ignore: true)
  _$$RoleImplCopyWith<_$RoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserTenantLink _$UserTenantLinkFromJson(Map<String, dynamic> json) {
  return _UserTenantLink.fromJson(json);
}

/// @nodoc
mixin _$UserTenantLink {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenant_id')
  int get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTenantLinkCopyWith<UserTenantLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTenantLinkCopyWith<$Res> {
  factory $UserTenantLinkCopyWith(
          UserTenantLink value, $Res Function(UserTenantLink) then) =
      _$UserTenantLinkCopyWithImpl<$Res, UserTenantLink>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'tenant_id') int tenantId,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$UserTenantLinkCopyWithImpl<$Res, $Val extends UserTenantLink>
    implements $UserTenantLinkCopyWith<$Res> {
  _$UserTenantLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? tenantId = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTenantLinkImplCopyWith<$Res>
    implements $UserTenantLinkCopyWith<$Res> {
  factory _$$UserTenantLinkImplCopyWith(_$UserTenantLinkImpl value,
          $Res Function(_$UserTenantLinkImpl) then) =
      __$$UserTenantLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'tenant_id') int tenantId,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$UserTenantLinkImplCopyWithImpl<$Res>
    extends _$UserTenantLinkCopyWithImpl<$Res, _$UserTenantLinkImpl>
    implements _$$UserTenantLinkImplCopyWith<$Res> {
  __$$UserTenantLinkImplCopyWithImpl(
      _$UserTenantLinkImpl _value, $Res Function(_$UserTenantLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? tenantId = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$UserTenantLinkImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTenantLinkImpl implements _UserTenantLink {
  const _$UserTenantLinkImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'tenant_id') required this.tenantId,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$UserTenantLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTenantLinkImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'tenant_id')
  final int tenantId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'UserTenantLink(userId: $userId, tenantId: $tenantId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTenantLinkImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, tenantId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTenantLinkImplCopyWith<_$UserTenantLinkImpl> get copyWith =>
      __$$UserTenantLinkImplCopyWithImpl<_$UserTenantLinkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTenantLinkImplToJson(
      this,
    );
  }
}

abstract class _UserTenantLink implements UserTenantLink {
  const factory _UserTenantLink(
          {@JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'tenant_id') required final int tenantId,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$UserTenantLinkImpl;

  factory _UserTenantLink.fromJson(Map<String, dynamic> json) =
      _$UserTenantLinkImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'tenant_id')
  int get tenantId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserTenantLinkImplCopyWith<_$UserTenantLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRoleLink _$UserRoleLinkFromJson(Map<String, dynamic> json) {
  return _UserRoleLink.fromJson(json);
}

/// @nodoc
mixin _$UserRoleLink {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_name')
  String get roleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRoleLinkCopyWith<UserRoleLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleLinkCopyWith<$Res> {
  factory $UserRoleLinkCopyWith(
          UserRoleLink value, $Res Function(UserRoleLink) then) =
      _$UserRoleLinkCopyWithImpl<$Res, UserRoleLink>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'role_name') String roleName,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$UserRoleLinkCopyWithImpl<$Res, $Val extends UserRoleLink>
    implements $UserRoleLinkCopyWith<$Res> {
  _$UserRoleLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? roleName = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRoleLinkImplCopyWith<$Res>
    implements $UserRoleLinkCopyWith<$Res> {
  factory _$$UserRoleLinkImplCopyWith(
          _$UserRoleLinkImpl value, $Res Function(_$UserRoleLinkImpl) then) =
      __$$UserRoleLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'role_name') String roleName,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$UserRoleLinkImplCopyWithImpl<$Res>
    extends _$UserRoleLinkCopyWithImpl<$Res, _$UserRoleLinkImpl>
    implements _$$UserRoleLinkImplCopyWith<$Res> {
  __$$UserRoleLinkImplCopyWithImpl(
      _$UserRoleLinkImpl _value, $Res Function(_$UserRoleLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? roleName = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$UserRoleLinkImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRoleLinkImpl implements _UserRoleLink {
  const _$UserRoleLinkImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'role_name') required this.roleName,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$UserRoleLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRoleLinkImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'role_name')
  final String roleName;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'UserRoleLink(userId: $userId, roleName: $roleName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoleLinkImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roleName, roleName) ||
                other.roleName == roleName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, roleName, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoleLinkImplCopyWith<_$UserRoleLinkImpl> get copyWith =>
      __$$UserRoleLinkImplCopyWithImpl<_$UserRoleLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRoleLinkImplToJson(
      this,
    );
  }
}

abstract class _UserRoleLink implements UserRoleLink {
  const factory _UserRoleLink(
          {@JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'role_name') required final String roleName,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$UserRoleLinkImpl;

  factory _UserRoleLink.fromJson(Map<String, dynamic> json) =
      _$UserRoleLinkImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'role_name')
  String get roleName;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserRoleLinkImplCopyWith<_$UserRoleLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatsOverview _$StatsOverviewFromJson(Map<String, dynamic> json) {
  return _StatsOverview.fromJson(json);
}

/// @nodoc
mixin _$StatsOverview {
  @JsonKey(name: 'sales_net')
  double? get salesNet => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_vat')
  double? get salesVat => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_total')
  double? get salesTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchases_net')
  double? get purchasesNet => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchases_vat')
  double? get purchasesVat => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchases_total')
  double? get purchasesTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_ticket')
  double? get averageTicket => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_count')
  int? get invoiceCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_count')
  int? get purchaseCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_date')
  DateTime? get fromDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_date')
  DateTime? get toDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_sync')
  DateTime? get lastSync => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsOverviewCopyWith<StatsOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsOverviewCopyWith<$Res> {
  factory $StatsOverviewCopyWith(
          StatsOverview value, $Res Function(StatsOverview) then) =
      _$StatsOverviewCopyWithImpl<$Res, StatsOverview>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sales_net') double? salesNet,
      @JsonKey(name: 'sales_vat') double? salesVat,
      @JsonKey(name: 'sales_total') double? salesTotal,
      @JsonKey(name: 'purchases_net') double? purchasesNet,
      @JsonKey(name: 'purchases_vat') double? purchasesVat,
      @JsonKey(name: 'purchases_total') double? purchasesTotal,
      @JsonKey(name: 'average_ticket') double? averageTicket,
      @JsonKey(name: 'invoice_count') int? invoiceCount,
      @JsonKey(name: 'purchase_count') int? purchaseCount,
      @JsonKey(name: 'from_date') DateTime? fromDate,
      @JsonKey(name: 'to_date') DateTime? toDate,
      @JsonKey(name: 'last_sync') DateTime? lastSync});
}

/// @nodoc
class _$StatsOverviewCopyWithImpl<$Res, $Val extends StatsOverview>
    implements $StatsOverviewCopyWith<$Res> {
  _$StatsOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesNet = freezed,
    Object? salesVat = freezed,
    Object? salesTotal = freezed,
    Object? purchasesNet = freezed,
    Object? purchasesVat = freezed,
    Object? purchasesTotal = freezed,
    Object? averageTicket = freezed,
    Object? invoiceCount = freezed,
    Object? purchaseCount = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? lastSync = freezed,
  }) {
    return _then(_value.copyWith(
      salesNet: freezed == salesNet
          ? _value.salesNet
          : salesNet // ignore: cast_nullable_to_non_nullable
              as double?,
      salesVat: freezed == salesVat
          ? _value.salesVat
          : salesVat // ignore: cast_nullable_to_non_nullable
              as double?,
      salesTotal: freezed == salesTotal
          ? _value.salesTotal
          : salesTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasesNet: freezed == purchasesNet
          ? _value.purchasesNet
          : purchasesNet // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasesVat: freezed == purchasesVat
          ? _value.purchasesVat
          : purchasesVat // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasesTotal: freezed == purchasesTotal
          ? _value.purchasesTotal
          : purchasesTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      averageTicket: freezed == averageTicket
          ? _value.averageTicket
          : averageTicket // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceCount: freezed == invoiceCount
          ? _value.invoiceCount
          : invoiceCount // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseCount: freezed == purchaseCount
          ? _value.purchaseCount
          : purchaseCount // ignore: cast_nullable_to_non_nullable
              as int?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsOverviewImplCopyWith<$Res>
    implements $StatsOverviewCopyWith<$Res> {
  factory _$$StatsOverviewImplCopyWith(
          _$StatsOverviewImpl value, $Res Function(_$StatsOverviewImpl) then) =
      __$$StatsOverviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sales_net') double? salesNet,
      @JsonKey(name: 'sales_vat') double? salesVat,
      @JsonKey(name: 'sales_total') double? salesTotal,
      @JsonKey(name: 'purchases_net') double? purchasesNet,
      @JsonKey(name: 'purchases_vat') double? purchasesVat,
      @JsonKey(name: 'purchases_total') double? purchasesTotal,
      @JsonKey(name: 'average_ticket') double? averageTicket,
      @JsonKey(name: 'invoice_count') int? invoiceCount,
      @JsonKey(name: 'purchase_count') int? purchaseCount,
      @JsonKey(name: 'from_date') DateTime? fromDate,
      @JsonKey(name: 'to_date') DateTime? toDate,
      @JsonKey(name: 'last_sync') DateTime? lastSync});
}

/// @nodoc
class __$$StatsOverviewImplCopyWithImpl<$Res>
    extends _$StatsOverviewCopyWithImpl<$Res, _$StatsOverviewImpl>
    implements _$$StatsOverviewImplCopyWith<$Res> {
  __$$StatsOverviewImplCopyWithImpl(
      _$StatsOverviewImpl _value, $Res Function(_$StatsOverviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesNet = freezed,
    Object? salesVat = freezed,
    Object? salesTotal = freezed,
    Object? purchasesNet = freezed,
    Object? purchasesVat = freezed,
    Object? purchasesTotal = freezed,
    Object? averageTicket = freezed,
    Object? invoiceCount = freezed,
    Object? purchaseCount = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? lastSync = freezed,
  }) {
    return _then(_$StatsOverviewImpl(
      salesNet: freezed == salesNet
          ? _value.salesNet
          : salesNet // ignore: cast_nullable_to_non_nullable
              as double?,
      salesVat: freezed == salesVat
          ? _value.salesVat
          : salesVat // ignore: cast_nullable_to_non_nullable
              as double?,
      salesTotal: freezed == salesTotal
          ? _value.salesTotal
          : salesTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasesNet: freezed == purchasesNet
          ? _value.purchasesNet
          : purchasesNet // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasesVat: freezed == purchasesVat
          ? _value.purchasesVat
          : purchasesVat // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasesTotal: freezed == purchasesTotal
          ? _value.purchasesTotal
          : purchasesTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      averageTicket: freezed == averageTicket
          ? _value.averageTicket
          : averageTicket // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceCount: freezed == invoiceCount
          ? _value.invoiceCount
          : invoiceCount // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseCount: freezed == purchaseCount
          ? _value.purchaseCount
          : purchaseCount // ignore: cast_nullable_to_non_nullable
              as int?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsOverviewImpl implements _StatsOverview {
  const _$StatsOverviewImpl(
      {@JsonKey(name: 'sales_net') this.salesNet,
      @JsonKey(name: 'sales_vat') this.salesVat,
      @JsonKey(name: 'sales_total') this.salesTotal,
      @JsonKey(name: 'purchases_net') this.purchasesNet,
      @JsonKey(name: 'purchases_vat') this.purchasesVat,
      @JsonKey(name: 'purchases_total') this.purchasesTotal,
      @JsonKey(name: 'average_ticket') this.averageTicket,
      @JsonKey(name: 'invoice_count') this.invoiceCount,
      @JsonKey(name: 'purchase_count') this.purchaseCount,
      @JsonKey(name: 'from_date') this.fromDate,
      @JsonKey(name: 'to_date') this.toDate,
      @JsonKey(name: 'last_sync') this.lastSync});

  factory _$StatsOverviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsOverviewImplFromJson(json);

  @override
  @JsonKey(name: 'sales_net')
  final double? salesNet;
  @override
  @JsonKey(name: 'sales_vat')
  final double? salesVat;
  @override
  @JsonKey(name: 'sales_total')
  final double? salesTotal;
  @override
  @JsonKey(name: 'purchases_net')
  final double? purchasesNet;
  @override
  @JsonKey(name: 'purchases_vat')
  final double? purchasesVat;
  @override
  @JsonKey(name: 'purchases_total')
  final double? purchasesTotal;
  @override
  @JsonKey(name: 'average_ticket')
  final double? averageTicket;
  @override
  @JsonKey(name: 'invoice_count')
  final int? invoiceCount;
  @override
  @JsonKey(name: 'purchase_count')
  final int? purchaseCount;
  @override
  @JsonKey(name: 'from_date')
  final DateTime? fromDate;
  @override
  @JsonKey(name: 'to_date')
  final DateTime? toDate;
  @override
  @JsonKey(name: 'last_sync')
  final DateTime? lastSync;

  @override
  String toString() {
    return 'StatsOverview(salesNet: $salesNet, salesVat: $salesVat, salesTotal: $salesTotal, purchasesNet: $purchasesNet, purchasesVat: $purchasesVat, purchasesTotal: $purchasesTotal, averageTicket: $averageTicket, invoiceCount: $invoiceCount, purchaseCount: $purchaseCount, fromDate: $fromDate, toDate: $toDate, lastSync: $lastSync)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsOverviewImpl &&
            (identical(other.salesNet, salesNet) ||
                other.salesNet == salesNet) &&
            (identical(other.salesVat, salesVat) ||
                other.salesVat == salesVat) &&
            (identical(other.salesTotal, salesTotal) ||
                other.salesTotal == salesTotal) &&
            (identical(other.purchasesNet, purchasesNet) ||
                other.purchasesNet == purchasesNet) &&
            (identical(other.purchasesVat, purchasesVat) ||
                other.purchasesVat == purchasesVat) &&
            (identical(other.purchasesTotal, purchasesTotal) ||
                other.purchasesTotal == purchasesTotal) &&
            (identical(other.averageTicket, averageTicket) ||
                other.averageTicket == averageTicket) &&
            (identical(other.invoiceCount, invoiceCount) ||
                other.invoiceCount == invoiceCount) &&
            (identical(other.purchaseCount, purchaseCount) ||
                other.purchaseCount == purchaseCount) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.lastSync, lastSync) ||
                other.lastSync == lastSync));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesNet,
      salesVat,
      salesTotal,
      purchasesNet,
      purchasesVat,
      purchasesTotal,
      averageTicket,
      invoiceCount,
      purchaseCount,
      fromDate,
      toDate,
      lastSync);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsOverviewImplCopyWith<_$StatsOverviewImpl> get copyWith =>
      __$$StatsOverviewImplCopyWithImpl<_$StatsOverviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsOverviewImplToJson(
      this,
    );
  }
}

abstract class _StatsOverview implements StatsOverview {
  const factory _StatsOverview(
          {@JsonKey(name: 'sales_net') final double? salesNet,
          @JsonKey(name: 'sales_vat') final double? salesVat,
          @JsonKey(name: 'sales_total') final double? salesTotal,
          @JsonKey(name: 'purchases_net') final double? purchasesNet,
          @JsonKey(name: 'purchases_vat') final double? purchasesVat,
          @JsonKey(name: 'purchases_total') final double? purchasesTotal,
          @JsonKey(name: 'average_ticket') final double? averageTicket,
          @JsonKey(name: 'invoice_count') final int? invoiceCount,
          @JsonKey(name: 'purchase_count') final int? purchaseCount,
          @JsonKey(name: 'from_date') final DateTime? fromDate,
          @JsonKey(name: 'to_date') final DateTime? toDate,
          @JsonKey(name: 'last_sync') final DateTime? lastSync}) =
      _$StatsOverviewImpl;

  factory _StatsOverview.fromJson(Map<String, dynamic> json) =
      _$StatsOverviewImpl.fromJson;

  @override
  @JsonKey(name: 'sales_net')
  double? get salesNet;
  @override
  @JsonKey(name: 'sales_vat')
  double? get salesVat;
  @override
  @JsonKey(name: 'sales_total')
  double? get salesTotal;
  @override
  @JsonKey(name: 'purchases_net')
  double? get purchasesNet;
  @override
  @JsonKey(name: 'purchases_vat')
  double? get purchasesVat;
  @override
  @JsonKey(name: 'purchases_total')
  double? get purchasesTotal;
  @override
  @JsonKey(name: 'average_ticket')
  double? get averageTicket;
  @override
  @JsonKey(name: 'invoice_count')
  int? get invoiceCount;
  @override
  @JsonKey(name: 'purchase_count')
  int? get purchaseCount;
  @override
  @JsonKey(name: 'from_date')
  DateTime? get fromDate;
  @override
  @JsonKey(name: 'to_date')
  DateTime? get toDate;
  @override
  @JsonKey(name: 'last_sync')
  DateTime? get lastSync;
  @override
  @JsonKey(ignore: true)
  _$$StatsOverviewImplCopyWith<_$StatsOverviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
