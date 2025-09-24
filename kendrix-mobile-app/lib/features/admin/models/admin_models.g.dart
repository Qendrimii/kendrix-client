// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminTenantImpl _$$AdminTenantImplFromJson(Map<String, dynamic> json) =>
    _$AdminTenantImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      externalKey: json['external_key'] as String?,
      status: json['status'] as String? ?? 'active',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      usersCount: (json['users_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AdminTenantImplToJson(_$AdminTenantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'external_key': instance.externalKey,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'users_count': instance.usersCount,
    };

_$CreateTenantRequestImpl _$$CreateTenantRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTenantRequestImpl(
      name: json['name'] as String,
      externalKey: json['external_key'] as String?,
      status: json['status'] as String? ?? 'active',
    );

Map<String, dynamic> _$$CreateTenantRequestImplToJson(
        _$CreateTenantRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'external_key': instance.externalKey,
      'status': instance.status,
    };

_$AdminUserImpl _$$AdminUserImplFromJson(Map<String, dynamic> json) =>
    _$AdminUserImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      displayName: json['display_name'] as String?,
      username: json['username'] as String?,
      active: json['active'] as bool? ?? true,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      tenants: (json['tenants'] as List<dynamic>?)
              ?.map((e) => AdminTenant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AdminUserImplToJson(_$AdminUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'display_name': instance.displayName,
      'username': instance.username,
      'active': instance.active,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'roles': instance.roles,
      'tenants': instance.tenants,
    };

_$CreateUserRequestImpl _$$CreateUserRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateUserRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      displayName: json['display_name'] as String?,
      username: json['username'] as String?,
      active: json['active'] as bool? ?? true,
    );

Map<String, dynamic> _$$CreateUserRequestImplToJson(
        _$CreateUserRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'display_name': instance.displayName,
      'username': instance.username,
      'active': instance.active,
    };

_$UpdateUserRequestImpl _$$UpdateUserRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateUserRequestImpl(
      email: json['email'] as String?,
      password: json['password'] as String?,
      displayName: json['display_name'] as String?,
      username: json['username'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$$UpdateUserRequestImplToJson(
        _$UpdateUserRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'display_name': instance.displayName,
      'username': instance.username,
      'active': instance.active,
    };

_$RoleImpl _$$RoleImplFromJson(Map<String, dynamic> json) => _$RoleImpl(
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      description: json['description'] as String?,
      permissions: (json['permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RoleImplToJson(_$RoleImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'description': instance.description,
      'permissions': instance.permissions,
    };

_$UserTenantLinkImpl _$$UserTenantLinkImplFromJson(Map<String, dynamic> json) =>
    _$UserTenantLinkImpl(
      userId: (json['user_id'] as num).toInt(),
      tenantId: (json['tenant_id'] as num).toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserTenantLinkImplToJson(
        _$UserTenantLinkImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$UserRoleLinkImpl _$$UserRoleLinkImplFromJson(Map<String, dynamic> json) =>
    _$UserRoleLinkImpl(
      userId: (json['user_id'] as num).toInt(),
      roleName: json['role_name'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserRoleLinkImplToJson(_$UserRoleLinkImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'role_name': instance.roleName,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$StatsOverviewImpl _$$StatsOverviewImplFromJson(Map<String, dynamic> json) =>
    _$StatsOverviewImpl(
      salesNet: (json['sales_net'] as num?)?.toDouble(),
      salesVat: (json['sales_vat'] as num?)?.toDouble(),
      salesTotal: (json['sales_total'] as num?)?.toDouble(),
      purchasesNet: (json['purchases_net'] as num?)?.toDouble(),
      purchasesVat: (json['purchases_vat'] as num?)?.toDouble(),
      purchasesTotal: (json['purchases_total'] as num?)?.toDouble(),
      averageTicket: (json['average_ticket'] as num?)?.toDouble(),
      invoiceCount: (json['invoice_count'] as num?)?.toInt(),
      purchaseCount: (json['purchase_count'] as num?)?.toInt(),
      fromDate: json['from_date'] == null
          ? null
          : DateTime.parse(json['from_date'] as String),
      toDate: json['to_date'] == null
          ? null
          : DateTime.parse(json['to_date'] as String),
      lastSync: json['last_sync'] == null
          ? null
          : DateTime.parse(json['last_sync'] as String),
    );

Map<String, dynamic> _$$StatsOverviewImplToJson(_$StatsOverviewImpl instance) =>
    <String, dynamic>{
      'sales_net': instance.salesNet,
      'sales_vat': instance.salesVat,
      'sales_total': instance.salesTotal,
      'purchases_net': instance.purchasesNet,
      'purchases_vat': instance.purchasesVat,
      'purchases_total': instance.purchasesTotal,
      'average_ticket': instance.averageTicket,
      'invoice_count': instance.invoiceCount,
      'purchase_count': instance.purchaseCount,
      'from_date': instance.fromDate?.toIso8601String(),
      'to_date': instance.toDate?.toIso8601String(),
      'last_sync': instance.lastSync?.toIso8601String(),
    };
