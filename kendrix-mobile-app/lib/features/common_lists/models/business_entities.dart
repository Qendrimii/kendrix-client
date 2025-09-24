import 'package:freezed_annotation/freezed_annotation.dart';

part 'stoku.freezed.dart';
part 'stoku.g.dart';

@freezed
class Stoku with _$Stoku {
  const factory Stoku({
    required int id,
    @JsonKey(name: 'artikulli_baze_id') int? articleId,
    @JsonKey(name: 'sasia_ne_stok') double? quantityInStock,
    @JsonKey(name: 'sasia_minimale') double? minimumQuantity,
    @JsonKey(name: 'sasia_maksimale') double? maximumQuantity,
    @JsonKey(name: 'cmimi_mesatar') double? averagePrice,
    @JsonKey(name: 'vlera_totale') double? totalValue,
    @JsonKey(name: 'data_fundit_levizjes') DateTime? lastMovementDate,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Relations
    @JsonKey(name: 'artikulli_baze') ArtikulliBaze? article,
  }) = _Stoku;

  factory Stoku.fromJson(Map<String, dynamic> json) => _$StokuFromJson(json);
}

@freezed
class MaterializedDaily with _$MaterializedDaily {
  const factory MaterializedDaily({
    required int id,
    @JsonKey(name: 'data') DateTime? date,
    @JsonKey(name: 'shitjet_neto') double? salesNet,
    @JsonKey(name: 'shitjet_tvsh') double? salesVat,
    @JsonKey(name: 'shitjet_totale') double? salesTotal,
    @JsonKey(name: 'blerjet_neto') double? purchasesNet,
    @JsonKey(name: 'blerjet_tvsh') double? purchasesVat,
    @JsonKey(name: 'blerjet_totale') double? purchasesTotal,
    @JsonKey(name: 'numri_faturave') int? invoiceCount,
    @JsonKey(name: 'numri_blerje') int? purchaseCount,
    @JsonKey(name: 'fatura_mesatare') double? averageInvoice,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _MaterializedDaily;

  factory MaterializedDaily.fromJson(Map<String, dynamic> json) =>
      _$MaterializedDailyFromJson(json);
}

@freezed
class Normativa with _$Normativa {
  const factory Normativa({
    required int id,
    @JsonKey(name: 'emri') String? name,
    @JsonKey(name: 'pershkrimi') String? description,
    @JsonKey(name: 'vlera') String? value,
    @JsonKey(name: 'tipi') String? type,
    @JsonKey(name: 'aktiv') bool? active,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Normativa;

  factory Normativa.fromJson(Map<String, dynamic> json) =>
      _$NormativaFromJson(json);
}

@freezed
class Tavolina with _$Tavolina {
  const factory Tavolina({
    required int id,
    @JsonKey(name: 'emri') String? name,
    @JsonKey(name: 'pershkrimi') String? description,
    @JsonKey(name: 'kapaciteti') int? capacity,
    @JsonKey(name: 'statusi') String? status,
    @JsonKey(name: 'aktiv') bool? active,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Tavolina;

  factory Tavolina.fromJson(Map<String, dynamic> json) =>
      _$TavolinaFromJson(json);
}

@freezed
class ZRaportet with _$ZRaportet {
  const factory ZRaportet({
    required int id,
    @JsonKey(name: 'emri') String? name,
    @JsonKey(name: 'pershkrimi') String? description,
    @JsonKey(name: 'tipi') String? type,
    @JsonKey(name: 'parametrat') Map<String, dynamic>? parameters,
    @JsonKey(name: 'te_dhenat') Map<String, dynamic>? data,
    @JsonKey(name: 'data_krijimit') DateTime? createdDate,
    @JsonKey(name: 'shfrytezuesi_id') int? userId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Relations
    @JsonKey(name: 'shfrytezuesi') Shfrytezuesi? user,
  }) = _ZRaportet;

  factory ZRaportet.fromJson(Map<String, dynamic> json) =>
      _$ZRaportetFromJson(json);
}

// Import related models
import 'artikulli_baze.dart';
import 'fatura.dart';