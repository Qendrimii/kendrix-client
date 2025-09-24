import 'package:freezed_annotation/freezed_annotation.dart';

part 'fatura.freezed.dart';
part 'fatura.g.dart';

@freezed
class Fatura with _$Fatura {
  const factory Fatura({
    required int id,
    @JsonKey(name: 'nr_fatures') String? invoiceNumber,
    @JsonKey(name: 'data') DateTime? date,
    @JsonKey(name: 'subjekti_id') int? subjectId,
    @JsonKey(name: 'shfrytezuesi_id') int? userId,
    @JsonKey(name: 'fatura_kategoria_id') int? categoryId,
    @JsonKey(name: 'totali_pa_tvsh') double? totalWithoutVat,
    @JsonKey(name: 'totali_tvsh') double? totalVat,
    @JsonKey(name: 'totali') double? total,
    @JsonKey(name: 'zbritja') double? discount,
    @JsonKey(name: 'statusi') String? status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Relations
    @JsonKey(name: 'subjekti') Subjekti? subject,
    @JsonKey(name: 'shfrytezuesi') Shfrytezuesi? user,
    @JsonKey(name: 'fatura_kategoria') FaturaKategoria? category,
    @JsonKey(name: 'porosi') List<Porosia>? orders,
    @JsonKey(name: 'pagesat') List<Pagesat>? payments,
  }) = _Fatura;

  factory Fatura.fromJson(Map<String, dynamic> json) => _$FaturaFromJson(json);
}

@freezed
class FaturaKategoria with _$FaturaKategoria {
  const factory FaturaKategoria({
    required int id,
    @JsonKey(name: 'emri') String? name,
    @JsonKey(name: 'pershkrimi') String? description,
    @JsonKey(name: 'aktiv') bool? active,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _FaturaKategoria;

  factory FaturaKategoria.fromJson(Map<String, dynamic> json) =>
      _$FaturaKategoriaFromJson(json);
}

@freezed
class Subjekti with _$Subjekti {
  const factory Subjekti({
    required int id,
    @JsonKey(name: 'emri') String? name,
    @JsonKey(name: 'adresa') String? address,
    @JsonKey(name: 'telefoni') String? phone,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'nipt') String? nipt,
    @JsonKey(name: 'tvsh_number') String? vatNumber,
    @JsonKey(name: 'lloji') String? type,
    @JsonKey(name: 'aktiv') bool? active,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Subjekti;

  factory Subjekti.fromJson(Map<String, dynamic> json) =>
      _$SubjektiFromJson(json);
}

@freezed
class Shfrytezuesi with _$Shfrytezuesi {
  const factory Shfrytezuesi({
    required int id,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'emri') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'aktiv') bool? active,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Shfrytezuesi;

  factory Shfrytezuesi.fromJson(Map<String, dynamic> json) =>
      _$ShfrytezuesiFromJson(json);
}

@freezed
class Porosia with _$Porosia {
  const factory Porosia({
    required int id,
    @JsonKey(name: 'fatura_id') int? invoiceId,
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
  }) = _Porosia;

  factory Porosia.fromJson(Map<String, dynamic> json) =>
      _$PorosiaFromJson(json);
}

@freezed
class Pagesat with _$Pagesat {
  const factory Pagesat({
    required int id,
    @JsonKey(name: 'fatura_id') int? invoiceId,
    @JsonKey(name: 'menyra_pageses_id') int? paymentMethodId,
    @JsonKey(name: 'shuma') double? amount,
    @JsonKey(name: 'kusuri') double? change,
    @JsonKey(name: 'data') DateTime? date,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Relations
    @JsonKey(name: 'menyra_pageses') MenyraPageses? paymentMethod,
  }) = _Pagesat;

  factory Pagesat.fromJson(Map<String, dynamic> json) =>
      _$PagesatFromJson(json);
}

@freezed
class MenyraPageses with _$MenyraPageses {
  const factory MenyraPageses({
    required int id,
    @JsonKey(name: 'emri') String? name,
    @JsonKey(name: 'pershkrimi') String? description,
    @JsonKey(name: 'aktiv') bool? active,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _MenyraPageses;

  factory MenyraPageses.fromJson(Map<String, dynamic> json) =>
      _$MenyraPagesestFromJson(json);
}

// Import the artikulli_baze models
import 'artikulli_baze.dart';