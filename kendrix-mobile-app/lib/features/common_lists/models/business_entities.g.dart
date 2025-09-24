// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StokuImpl _$$StokuImplFromJson(Map<String, dynamic> json) => _$StokuImpl(
      id: (json['id'] as num).toInt(),
      articleId: (json['ProduktiId'] as num?)?.toInt(),
      quantityInStock: (json['Sasia'] as num?)?.toDouble(),
      reorderLevel: (json['LevelIRenditjes'] as num?)?.toInt(),
      location: json['Lokacioni'] as String?,
      createdAt: json['DataEKrijimit'] == null
          ? null
          : DateTime.parse(json['DataEKrijimit'] as String),
      updatedAt: json['DataEModifikimit'] == null
          ? null
          : DateTime.parse(json['DataEModifikimit'] as String),
      deleted: json['Fshire'] as bool?,
      article: json['artikulli_baze'] == null
          ? null
          : ArtikulliBaze.fromJson(
              json['artikulli_baze'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StokuImplToJson(_$StokuImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ProduktiId': instance.articleId,
      'Sasia': instance.quantityInStock,
      'LevelIRenditjes': instance.reorderLevel,
      'Lokacioni': instance.location,
      'DataEKrijimit': instance.createdAt?.toIso8601String(),
      'DataEModifikimit': instance.updatedAt?.toIso8601String(),
      'Fshire': instance.deleted,
      'artikulli_baze': instance.article,
    };

_$MaterializedDailyImpl _$$MaterializedDailyImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterializedDailyImpl(
      id: (json['id'] as num).toInt(),
      date: json['Ymd'] == null ? null : DateTime.parse(json['Ymd'] as String),
      salesNet: (json['SalesNet'] as num?)?.toDouble(),
      salesVat: (json['SalesVat'] as num?)?.toDouble(),
      purchasesNet: (json['PurchasesNet'] as num?)?.toDouble(),
      purchasesVat: (json['PurchasesVat'] as num?)?.toDouble(),
      averageTicket: (json['AvgTicket'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MaterializedDailyImplToJson(
        _$MaterializedDailyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Ymd': instance.date?.toIso8601String(),
      'SalesNet': instance.salesNet,
      'SalesVat': instance.salesVat,
      'PurchasesNet': instance.purchasesNet,
      'PurchasesVat': instance.purchasesVat,
      'AvgTicket': instance.averageTicket,
    };

_$NormativaImpl _$$NormativaImplFromJson(Map<String, dynamic> json) =>
    _$NormativaImpl(
      id: (json['id'] as num).toInt(),
      name: json['emri'] as String?,
      description: json['pershkrimi'] as String?,
      value: json['vlera'] as String?,
      type: json['tipi'] as String?,
      active: json['aktiv'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$NormativaImplToJson(_$NormativaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emri': instance.name,
      'pershkrimi': instance.description,
      'vlera': instance.value,
      'tipi': instance.type,
      'aktiv': instance.active,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$TavolinaImpl _$$TavolinaImplFromJson(Map<String, dynamic> json) =>
    _$TavolinaImpl(
      id: (json['id'] as num).toInt(),
      name: json['emri'] as String?,
      description: json['pershkrimi'] as String?,
      capacity: (json['kapaciteti'] as num?)?.toInt(),
      status: json['statusi'] as String?,
      active: json['aktiv'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$TavolinaImplToJson(_$TavolinaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emri': instance.name,
      'pershkrimi': instance.description,
      'kapaciteti': instance.capacity,
      'statusi': instance.status,
      'aktiv': instance.active,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$ZRaportetImpl _$$ZRaportetImplFromJson(Map<String, dynamic> json) =>
    _$ZRaportetImpl(
      id: (json['id'] as num).toInt(),
      name: json['emri'] as String?,
      description: json['pershkrimi'] as String?,
      type: json['tipi'] as String?,
      parameters: json['parametrat'] as Map<String, dynamic>?,
      data: json['te_dhenat'] as Map<String, dynamic>?,
      createdDate: json['data_krijimit'] == null
          ? null
          : DateTime.parse(json['data_krijimit'] as String),
      userId: (json['shfrytezuesi_id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      user: json['shfrytezuesi'] == null
          ? null
          : Shfrytezuesi.fromJson(json['shfrytezuesi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ZRaportetImplToJson(_$ZRaportetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emri': instance.name,
      'pershkrimi': instance.description,
      'tipi': instance.type,
      'parametrat': instance.parameters,
      'te_dhenat': instance.data,
      'data_krijimit': instance.createdDate?.toIso8601String(),
      'shfrytezuesi_id': instance.userId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'shfrytezuesi': instance.user,
    };
