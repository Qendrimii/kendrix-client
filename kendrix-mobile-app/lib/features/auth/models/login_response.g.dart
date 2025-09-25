// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      token: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      tenant: json['tenant'] as Map<String, dynamic>?,
      expiresAt: json['expiresAt'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'refresh_token': instance.refreshToken,
      'user': instance.user,
      'tenant': instance.tenant,
      'expiresAt': instance.expiresAt,
    };
