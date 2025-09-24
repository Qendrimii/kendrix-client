import 'package:freezed_annotation/freezed_annotation.dart';

part 'artikulli_baze.freezed.dart';
part 'artikulli_baze.g.dart';

@freezed
class ArtikulliBaze with _$ArtikulliBaze {
  const factory ArtikulliBaze({
    required int id,
    @JsonKey(name: 'Artikull') bool? isArticle,
    @JsonKey(name: 'Sherbim') bool? isService,
    @JsonKey(name: 'Shifra') String? code,
    @JsonKey(name: 'Emri') String? name,
    @JsonKey(name: 'Njesia') String? unit,
    @JsonKey(name: 'Barkodi') String? barcode,
    @JsonKey(name: 'Cmimi_I_Shitjes_Cope') double? sellingPricePerPiece,
    @JsonKey(name: 'Cmimi_I_Shitjes_Pako') double? sellingPricePerPackage,
    @JsonKey(name: 'SasiaPako') int? packageQuantity,
    @JsonKey(name: 'KategoriaId') int? categoryId,
    @JsonKey(name: 'Aktiv') bool? active,
    @JsonKey(name: 'ArtikullIPerbere') bool? isComposite,
    @JsonKey(name: 'EmriGjenerik') String? genericName,
    @JsonKey(name: 'Prodhuesi') String? manufacturer,
    @JsonKey(name: 'ArtNgaPeshorja') bool? fromScale,
    @JsonKey(name: 'TvshId') int? tvshId,
    @JsonKey(name: 'EmertimiiDyte') String? alternativeName,
    @JsonKey(name: 'PeshaNeto') double? netWeight,
    @JsonKey(name: 'PeshaBruto') double? grossWeight,
    @JsonKey(name: 'Gjatesia') double? length,
    @JsonKey(name: 'Gjersia') double? width,
    @JsonKey(name: 'Lartesia') double? height,
    @JsonKey(name: 'SasiaMinimale') double? minimumQuantity,
    @JsonKey(name: 'SasiaMaksimale') double? maximumQuantity,
    @JsonKey(name: 'Afatshkurte') bool? shortTerm,
    @JsonKey(name: 'Afatgjate') bool? longTerm,
    @JsonKey(name: 'NormaZhvleresimit') double? depreciationRate,
    @JsonKey(name: 'DataEFillimitTeZhvlersimit') DateTime? depreciationStartDate,
    @JsonKey(name: 'TempId') int? tempId,
    @JsonKey(name: 'Skadimi') DateTime? expiryDate,
    @JsonKey(name: 'Ambalazhi') String? packaging,
    @JsonKey(name: 'IRimbursueshem') bool? isRefundable,
    @JsonKey(name: 'OrigjinaEMallit') String? origin,
    @JsonKey(name: 'KostoEProdhimit') int? productionCost,
    @JsonKey(name: 'Rafti') String? shelf,
    @JsonKey(name: 'KodiDoganor') String? customsCode,
    @JsonKey(name: 'SubjektiId') int? subjectId,
    @JsonKey(name: 'IncomeAccountId') int? incomeAccountId,
    @JsonKey(name: 'ExpenseAccountId') int? expenseAccountId,
    @JsonKey(name: 'IsGroup') bool? isGroup,
    @JsonKey(name: 'GroupId') int? groupId,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
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
    @JsonKey(name: 'Emri') String? name,
    @JsonKey(name: 'Color') String? color,
    @JsonKey(name: 'Printer') String? printer,
    @JsonKey(name: 'Lloji') int? type,
    @JsonKey(name: 'EmriNePrinter') String? printerName,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
  }) = _Kategoria;

  factory Kategoria.fromJson(Map<String, dynamic> json) =>
      _$KategoriaFromJson(json);
}

@freezed
class TVSH with _$TVSH {
  const factory TVSH({
    required int id,
    @JsonKey(name: 'Perqindja') double? percentage,
    @JsonKey(name: 'Grupi') String? group,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
    @JsonKey(name: 'Fshire') bool? deleted,
  }) = _TVSH;

  factory TVSH.fromJson(Map<String, dynamic> json) => _$TVSHFromJson(json);
}