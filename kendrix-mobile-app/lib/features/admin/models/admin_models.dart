import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_models.freezed.dart';
part 'admin_models.g.dart';

@freezed
class AdminTenant with _$AdminTenant {
  const factory AdminTenant({
    required int id,
    required String name,
    @JsonKey(name: 'external_key') String? externalKey,
    @Default('active') String status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'users_count') int? usersCount,
  }) = _AdminTenant;

  factory AdminTenant.fromJson(Map<String, dynamic> json) =>
      _$AdminTenantFromJson(json);
}

@freezed
class CreateTenantRequest with _$CreateTenantRequest {
  const factory CreateTenantRequest({
    required String name,
    @JsonKey(name: 'external_key') String? externalKey,
    @Default('active') String status,
  }) = _CreateTenantRequest;

  factory CreateTenantRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTenantRequestFromJson(json);
}

@freezed
class AdminUser with _$AdminUser {
  const factory AdminUser({
    required int id,
    required String email,
    @JsonKey(name: 'display_name') String? displayName,
    String? username,
    @Default(true) bool active,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default([]) List<String> roles,
    @Default([]) List<AdminTenant> tenants,
  }) = _AdminUser;

  factory AdminUser.fromJson(Map<String, dynamic> json) =>
      _$AdminUserFromJson(json);
}

@freezed
class CreateUserRequest with _$CreateUserRequest {
  const factory CreateUserRequest({
    required String email,
    required String password,
    @JsonKey(name: 'display_name') String? displayName,
    String? username,
    @Default(true) bool active,
  }) = _CreateUserRequest;

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);
}

@freezed
class UpdateUserRequest with _$UpdateUserRequest {
  const factory UpdateUserRequest({
    String? email,
    String? password,
    @JsonKey(name: 'display_name') String? displayName,
    String? username,
    bool? active,
  }) = _UpdateUserRequest;

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);
}

@freezed
class Role with _$Role {
  const factory Role({
    required String name,
    required String displayName,
    String? description,
    @Default([]) List<String> permissions,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

@freezed
class UserTenantLink with _$UserTenantLink {
  const factory UserTenantLink({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'tenant_id') required int tenantId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _UserTenantLink;

  factory UserTenantLink.fromJson(Map<String, dynamic> json) =>
      _$UserTenantLinkFromJson(json);
}

@freezed
class UserRoleLink with _$UserRoleLink {
  const factory UserRoleLink({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'role_name') required String roleName,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _UserRoleLink;

  factory UserRoleLink.fromJson(Map<String, dynamic> json) =>
      _$UserRoleLinkFromJson(json);
}

@freezed
class StatsOverview with _$StatsOverview {
  const factory StatsOverview({
    @JsonKey(name: 'sales_net') double? salesNet,
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
    @JsonKey(name: 'last_sync') DateTime? lastSync,
  }) = _StatsOverview;

  factory StatsOverview.fromJson(Map<String, dynamic> json) =>
      _$StatsOverviewFromJson(json);
}