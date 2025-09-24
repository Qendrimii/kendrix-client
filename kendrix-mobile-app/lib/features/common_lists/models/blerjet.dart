import 'package:freezed_annotation/freezed_annotation.dart';
import 'fatura.dart';
import 'artikulli_baze.dart';

part 'blerjet.freezed.dart';
part 'blerjet.g.dart';

@freezed
class Blerjet with _$Blerjet {
  const factory Blerjet({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'DataEFatures') DateTime? date,
    @JsonKey(name: 'NrFatures') String? purchaseNumber,
    @JsonKey(name: 'AfatiPageses') DateTime? paymentDue,
    @JsonKey(name: 'BlerjeKategoriaId') int? categoryId,
    @JsonKey(name: 'NumriFaturesSeFurnitorit') String? supplierInvoiceNumber,
    @JsonKey(name: 'Fatura') String? invoice,
    @JsonKey(name: 'Staff', fromJson: _boolFromInt) @Default(false) bool staff,
    @JsonKey(name: 'SubjektiId') int? supplierId,
    @JsonKey(name: 'PagesaId') int? paymentId,
    @JsonKey(name: 'StatusFatureId') int? statusId,
    @JsonKey(name: 'OptimisticLockField') int? optimisticLockField,
    @JsonKey(name: 'fTotalPorosias') double? totalOrders,
    @JsonKey(name: 'fTotalVAT') double? totalVat,
    @JsonKey(name: 'TotalPorosias') double? totalOrdersFinal,
    @JsonKey(name: 'TotalVAT') double? totalVatFinal,
    @JsonKey(name: 'ArkaId') int? cashRegisterId,
    @JsonKey(name: 'MenyraPagesesId') int? paymentMethodId,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
    @JsonKey(name: 'Fshire', fromJson: _boolFromInt) @Default(false) bool deleted,
    // Relations
    @JsonKey(name: 'furnitori') Subjekti? supplier,
    @JsonKey(name: 'shfrytezuesi') Shfrytezuesi? user,
    @JsonKey(name: 'blerje_kategoria') BlerjeKategoria? category,
    @JsonKey(name: 'porosite_blerjes') List<PorositeEBlerjes>? purchaseOrders,
  }) = _Blerjet;

  factory Blerjet.fromJson(Map<String, dynamic> json) => _$BlerjetFromJson(json);
}

@freezed
class BlerjeKategoria with _$BlerjeKategoria {
  const factory BlerjeKategoria({
    required int id,
    @JsonKey(name: 'Emri') String? name,
    @JsonKey(name: 'Kodi') String? code,
    @JsonKey(name: 'Pershkrimi') String? description,
    @JsonKey(name: 'TvshId') int? tvshId,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
    @JsonKey(name: 'Fshire', fromJson: _boolFromInt) @Default(false) bool deleted,
  }) = _BlerjeKategoria;

  factory BlerjeKategoria.fromJson(Map<String, dynamic> json) =>
      _$BlerjeKategoriaFromJson(json);
}

@freezed
class PorositeEBlerjes with _$PorositeEBlerjes {
  const factory PorositeEBlerjes({
    required int id,
    @JsonKey(name: 'ProduktiId') int? productId,
    @JsonKey(name: 'Sasia') double? quantity,
    @JsonKey(name: 'CmimiNjesi') double? unitPrice,
    @JsonKey(name: 'BlerjaId') int? purchaseId,
    @JsonKey(name: 'PorosiaDate') DateTime? orderDate,
    @JsonKey(name: 'Tvsh') double? vat,
    @JsonKey(name: 'Rabati') double? discount,
    @JsonKey(name: 'Total') double? total,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
    @JsonKey(name: 'Fshire', fromJson: _boolFromInt) @Default(false) bool deleted,
  }) = _PorositeEBlerjes;

  factory PorositeEBlerjes.fromJson(Map<String, dynamic> json) =>
      _$PorositeEBlerjesFromJson(json);
}

// Helper function to convert int to bool
bool _boolFromInt(dynamic value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is int) return value != 0;
  if (value is String) return value.toLowerCase() == 'true' || value == '1';
  return false;
}