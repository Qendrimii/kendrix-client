import 'package:freezed_annotation/freezed_annotation.dart';

part 'artikulli_baze.freezed.dart';
part 'artikulli_baze.g.dart';

@freezed
class ArtikulliBaze with _$ArtikulliBaze {
  const factory ArtikulliBaze({
    required int id,
    @JsonKey(name: 'emri') String? name,
    @JsonKey(name: 'pershkrimi') String? description,
    @JsonKey(name: 'kodi') String? code,
    @JsonKey(name: 'njesia') String? unit,
    @JsonKey(name: 'cmimi_blerjes') double? purchasePrice,
    @JsonKey(name: 'cmimi_shitjes') double? sellingPrice,
    @JsonKey(name: 'tvsh_id') int? tvshId,
    @JsonKey(name: 'kategoria_id') int? categoryId,
    @JsonKey(name: 'aktiv') bool? active,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Relations
    @JsonKey(name: 'kategoria') Kategoria? category,
    @JsonKey(name: 'tvsh') TVSH? tvsh,
  }) = _ArtikulliBaze;

  factory ArtikulliBaze.fromJson(Map<String, dynamic> json) =>
      _$ArtikulliBazeFromJson(json);
}

@freezed
class Kategoria with _$Kategoria {
  const factory Kategoria({
    required int id,
    @JsonKey(name: 'emri') String? name,
    @JsonKey(name: 'pershkrimi') String? description,
    @JsonKey(name: 'aktiv') bool? active,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Kategoria;

  factory Kategoria.fromJson(Map<String, dynamic> json) =>
      _$KategoriaFromJson(json);
}

@freezed
class TVSH with _$TVSH {
  const factory TVSH({
    required int id,
    @JsonKey(name: 'emri') String? name,
    @JsonKey(name: 'vlera') double? value,
    @JsonKey(name: 'aktiv') bool? active,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _TVSH;

  factory TVSH.fromJson(Map<String, dynamic> json) => _$TVSHFromJson(json);
}