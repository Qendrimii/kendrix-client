import 'package:freezed_annotation/freezed_annotation.dart';

part 'blerjet.freezed.dart';
part 'blerjet.g.dart';

@freezed
class Blerjet with _$Blerjet {
  const factory Blerjet({
    required int id,
    @JsonKey(name: 'nr_blerjes') String? purchaseNumber,
    @JsonKey(name: 'data') DateTime? date,
    @JsonKey(name: 'furnitori_id') int? supplierId,
    @JsonKey(name: 'shfrytezuesi_id') int? userId,
    @JsonKey(name: 'blerje_kategoria_id') int? categoryId,
    @JsonKey(name: 'totali_pa_tvsh') double? totalWithoutVat,
    @JsonKey(name: 'totali_tvsh') double? totalVat,
    @JsonKey(name: 'totali') double? total,
    @JsonKey(name: 'zbritja') double? discount,
    @JsonKey(name: 'statusi') String? status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
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
    @JsonKey(name: 'emri') String? name,
    @JsonKey(name: 'pershkrimi') String? description,
    @JsonKey(name: 'aktiv') bool? active,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _BlerjeKategoria;

  factory BlerjeKategoria.fromJson(Map<String, dynamic> json) =>
      _$BlerjeKategoriaFromJson(json);
}

@freezed
class PorositeEBlerjes with _$PorositeEBlerjes {
  const factory PorositeEBlerjes({
    required int id,
    @JsonKey(name: 'blerja_id') int? purchaseId,
    @JsonKey(name: 'artikulli_baze_id') int? articleId,
    @JsonKey(name: 'sasia') double? quantity,
    @JsonKey(name: 'cmimi') double? price,
    @JsonKey(name: 'zbritja') double? discount,
    @JsonKey(name: 'tvsh_vlera') double? vatValue,
    @JsonKey(name: 'totali_pa_tvsh') double? totalWithoutVat,
    @JsonKey(name: 'totali_tvsh') double? totalVat,
    @JsonKey(name: 'totali') double? total,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Relations
    @JsonKey(name: 'artikulli_baze') ArtikulliBaze? article,
  }) = _PorositeEBlerjes;

  factory PorositeEBlerjes.fromJson(Map<String, dynamic> json) =>
      _$PorositeEBlerjesFromJson(json);
}

// Import related models
import 'fatura.dart';
import 'artikulli_baze.dart';