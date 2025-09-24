// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blerjet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlerjetImpl _$$BlerjetImplFromJson(Map<String, dynamic> json) =>
    _$BlerjetImpl(
      id: (json['Id'] as num).toInt(),
      date: json['DataEFatures'] == null
          ? null
          : DateTime.parse(json['DataEFatures'] as String),
      purchaseNumber: json['NrFatures'] as String?,
      paymentDue: json['AfatiPageses'] == null
          ? null
          : DateTime.parse(json['AfatiPageses'] as String),
      categoryId: (json['BlerjeKategoriaId'] as num?)?.toInt(),
      supplierInvoiceNumber: json['NumriFaturesSeFurnitorit'] as String?,
      invoice: json['Fatura'] as String?,
      staff: json['Staff'] == null ? false : _boolFromInt(json['Staff']),
      supplierId: (json['SubjektiId'] as num?)?.toInt(),
      paymentId: (json['PagesaId'] as num?)?.toInt(),
      statusId: (json['StatusFatureId'] as num?)?.toInt(),
      optimisticLockField: (json['OptimisticLockField'] as num?)?.toInt(),
      totalOrders: (json['fTotalPorosias'] as num?)?.toDouble(),
      totalVat: (json['fTotalVAT'] as num?)?.toDouble(),
      totalOrdersFinal: (json['TotalPorosias'] as num?)?.toDouble(),
      totalVatFinal: (json['TotalVAT'] as num?)?.toDouble(),
      cashRegisterId: (json['ArkaId'] as num?)?.toInt(),
      paymentMethodId: (json['MenyraPagesesId'] as num?)?.toInt(),
      createdAt: json['DataEKrijimit'] == null
          ? null
          : DateTime.parse(json['DataEKrijimit'] as String),
      updatedAt: json['DataEModifikimit'] == null
          ? null
          : DateTime.parse(json['DataEModifikimit'] as String),
      deleted: json['Fshire'] == null ? false : _boolFromInt(json['Fshire']),
      supplier: json['furnitori'] == null
          ? null
          : Subjekti.fromJson(json['furnitori'] as Map<String, dynamic>),
      user: json['shfrytezuesi'] == null
          ? null
          : Shfrytezuesi.fromJson(json['shfrytezuesi'] as Map<String, dynamic>),
      category: json['blerje_kategoria'] == null
          ? null
          : BlerjeKategoria.fromJson(
              json['blerje_kategoria'] as Map<String, dynamic>),
      purchaseOrders: (json['porosite_blerjes'] as List<dynamic>?)
          ?.map((e) => PorositeEBlerjes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BlerjetImplToJson(_$BlerjetImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'DataEFatures': instance.date?.toIso8601String(),
      'NrFatures': instance.purchaseNumber,
      'AfatiPageses': instance.paymentDue?.toIso8601String(),
      'BlerjeKategoriaId': instance.categoryId,
      'NumriFaturesSeFurnitorit': instance.supplierInvoiceNumber,
      'Fatura': instance.invoice,
      'Staff': instance.staff,
      'SubjektiId': instance.supplierId,
      'PagesaId': instance.paymentId,
      'StatusFatureId': instance.statusId,
      'OptimisticLockField': instance.optimisticLockField,
      'fTotalPorosias': instance.totalOrders,
      'fTotalVAT': instance.totalVat,
      'TotalPorosias': instance.totalOrdersFinal,
      'TotalVAT': instance.totalVatFinal,
      'ArkaId': instance.cashRegisterId,
      'MenyraPagesesId': instance.paymentMethodId,
      'DataEKrijimit': instance.createdAt?.toIso8601String(),
      'DataEModifikimit': instance.updatedAt?.toIso8601String(),
      'Fshire': instance.deleted,
      'furnitori': instance.supplier,
      'shfrytezuesi': instance.user,
      'blerje_kategoria': instance.category,
      'porosite_blerjes': instance.purchaseOrders,
    };

_$BlerjeKategoriaImpl _$$BlerjeKategoriaImplFromJson(
        Map<String, dynamic> json) =>
    _$BlerjeKategoriaImpl(
      id: (json['id'] as num).toInt(),
      name: json['Emri'] as String?,
      code: json['Kodi'] as String?,
      description: json['Pershkrimi'] as String?,
      tvshId: (json['TvshId'] as num?)?.toInt(),
      createdAt: json['DataEKrijimit'] == null
          ? null
          : DateTime.parse(json['DataEKrijimit'] as String),
      updatedAt: json['DataEModifikimit'] == null
          ? null
          : DateTime.parse(json['DataEModifikimit'] as String),
      deleted: json['Fshire'] == null ? false : _boolFromInt(json['Fshire']),
    );

Map<String, dynamic> _$$BlerjeKategoriaImplToJson(
        _$BlerjeKategoriaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Emri': instance.name,
      'Kodi': instance.code,
      'Pershkrimi': instance.description,
      'TvshId': instance.tvshId,
      'DataEKrijimit': instance.createdAt?.toIso8601String(),
      'DataEModifikimit': instance.updatedAt?.toIso8601String(),
      'Fshire': instance.deleted,
    };

_$PorositeEBlerjesImpl _$$PorositeEBlerjesImplFromJson(
        Map<String, dynamic> json) =>
    _$PorositeEBlerjesImpl(
      id: (json['id'] as num).toInt(),
      productId: (json['ProduktiId'] as num?)?.toInt(),
      quantity: (json['Sasia'] as num?)?.toDouble(),
      unitPrice: (json['CmimiNjesi'] as num?)?.toDouble(),
      purchaseId: (json['BlerjaId'] as num?)?.toInt(),
      orderDate: json['PorosiaDate'] == null
          ? null
          : DateTime.parse(json['PorosiaDate'] as String),
      vat: (json['Tvsh'] as num?)?.toDouble(),
      discount: (json['Rabati'] as num?)?.toDouble(),
      total: (json['Total'] as num?)?.toDouble(),
      createdAt: json['DataEKrijimit'] == null
          ? null
          : DateTime.parse(json['DataEKrijimit'] as String),
      updatedAt: json['DataEModifikimit'] == null
          ? null
          : DateTime.parse(json['DataEModifikimit'] as String),
      deleted: json['Fshire'] == null ? false : _boolFromInt(json['Fshire']),
    );

Map<String, dynamic> _$$PorositeEBlerjesImplToJson(
        _$PorositeEBlerjesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ProduktiId': instance.productId,
      'Sasia': instance.quantity,
      'CmimiNjesi': instance.unitPrice,
      'BlerjaId': instance.purchaseId,
      'PorosiaDate': instance.orderDate?.toIso8601String(),
      'Tvsh': instance.vat,
      'Rabati': instance.discount,
      'Total': instance.total,
      'DataEKrijimit': instance.createdAt?.toIso8601String(),
      'DataEModifikimit': instance.updatedAt?.toIso8601String(),
      'Fshire': instance.deleted,
    };
