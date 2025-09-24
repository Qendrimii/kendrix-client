import 'package:freezed_annotation/freezed_annotation.dart';
import 'artikulli_baze.dart';
import 'fatura.dart';

part 'business_entities.freezed.dart';
part 'business_entities.g.dart';

@freezed
class Stoku with _$Stoku {
  const factory Stoku({
    required int id,
    @JsonKey(name: 'ProduktiId') int? articleId,
    @JsonKey(name: 'Sasia') double? quantityInStock,
    @JsonKey(name: 'LevelIRenditjes') int? reorderLevel,
    @JsonKey(name: 'Lokacioni') String? location,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
    @JsonKey(name: 'Fshire') bool? deleted,
    // Relations
    @JsonKey(name: 'artikulli_baze') ArtikulliBaze? article,
  }) = _Stoku;

  factory Stoku.fromJson(Map<String, dynamic> json) => _$StokuFromJson(json);
}

@freezed
class MaterializedDaily with _$MaterializedDaily {
  const factory MaterializedDaily({
    required int id,
    @JsonKey(name: 'Ymd') DateTime? date,
    @JsonKey(name: 'SalesNet') double? salesNet,
    @JsonKey(name: 'SalesVat') double? salesVat,
    @JsonKey(name: 'PurchasesNet') double? purchasesNet,
    @JsonKey(name: 'PurchasesVat') double? purchasesVat,
    @JsonKey(name: 'AvgTicket') double? averageTicket,
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