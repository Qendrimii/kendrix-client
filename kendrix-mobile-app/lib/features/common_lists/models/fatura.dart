import 'package:freezed_annotation/freezed_annotation.dart';
import 'artikulli_baze.dart';

part 'fatura.freezed.dart';
part 'fatura.g.dart';

@freezed
class Fatura with _$Fatura {
  const factory Fatura({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'NrFatures') String? invoiceNumber,
    @JsonKey(name: 'Data') DateTime? date,
    @JsonKey(name: 'SubjektiId') int? subjectId,
    @JsonKey(name: 'ShfrytezuesiId') int? userId,
    @JsonKey(name: 'FaturaKategoriaId') int? categoryId,
    @JsonKey(name: 'TotaliPaTvsh') double? totalWithoutVat,
    @JsonKey(name: 'TotaliTvsh') double? totalVat,
    @JsonKey(name: 'Totali') double? total,
    @JsonKey(name: 'Zbritja') double? discount,
    @JsonKey(name: 'Statusi') String? status,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
    @JsonKey(name: 'Fshire', fromJson: _boolFromInt) @Default(false) bool deleted,
    @JsonKey(name: 'Staff', fromJson: _boolFromInt) @Default(false) bool staff,
    @JsonKey(name: 'AfatiPageses') DateTime? paymentDue,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'tenant_id') int? tenantId,
    @JsonKey(name: 'StatusFatureId') int? statusId,
    @JsonKey(name: 'PagesaId') int? paymentId,
    @JsonKey(name: 'KodiValues') String? currencyCode,
    @JsonKey(name: 'KursiKembimit', fromJson: _doubleFromString) double? exchangeRate,
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
    @JsonKey(name: 'Emri') String? name,
    @JsonKey(name: 'Kodi') String? code,
    @JsonKey(name: 'Pershkrimi') String? description,
    @JsonKey(name: 'TvshId') int? tvshId,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
    @JsonKey(name: 'Fshire', fromJson: _boolFromInt) @Default(false) bool deleted,
  }) = _FaturaKategoria;

  factory FaturaKategoria.fromJson(Map<String, dynamic> json) =>
      _$FaturaKategoriaFromJson(json);
}

@freezed
class Subjekti with _$Subjekti {
  const factory Subjekti({
    required int id,
    @JsonKey(name: 'Kodi') String? code,
    @JsonKey(name: 'Emertimi') String? name,
    @JsonKey(name: 'Furnitor') bool? isSupplier,
    @JsonKey(name: 'Bleres') bool? isCustomer,
    @JsonKey(name: 'NrUnik') String? uniqueNumber,
    @JsonKey(name: 'NoFiskal') String? fiscalNumber,
    @JsonKey(name: 'NoTVSH') String? vatNumber,
    @JsonKey(name: 'NIB') String? nib,
    @JsonKey(name: 'Adresa') String? address,
    @JsonKey(name: 'Telefoni') String? phone,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Rabati') double? discount,
    @JsonKey(name: 'Pershkrimi') String? description,
    @JsonKey(name: 'KontojaArketueshme') int? receivableAccount,
    @JsonKey(name: 'KontojaPagueshme') int? payableAccount,
    @JsonKey(name: 'Limiti') double? limit,
    @JsonKey(name: 'Fshire', fromJson: _boolFromInt) @Default(false) bool deleted,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
  }) = _Subjekti;

  factory Subjekti.fromJson(Map<String, dynamic> json) =>
      _$SubjektiFromJson(json);
}

@freezed
class Shfrytezuesi with _$Shfrytezuesi {
  const factory Shfrytezuesi({
    required int id,
    @JsonKey(name: 'Username') String? username,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Tel') String? phone,
    @JsonKey(name: 'Aktiv') bool? active,
    @JsonKey(name: 'Color') String? color,
    @JsonKey(name: 'RoleId') int? roleId,
    @JsonKey(name: 'PunetoriId') int? employeeId,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
    @JsonKey(name: 'Fshire', fromJson: _boolFromInt) @Default(false) bool deleted,
  }) = _Shfrytezuesi;

  factory Shfrytezuesi.fromJson(Map<String, dynamic> json) =>
      _$ShfrytezuesiFromJson(json);
}

@freezed
class Porosia with _$Porosia {
  const factory Porosia({
    required int id,
    @JsonKey(name: 'FaturaId') int? invoiceId,
    @JsonKey(name: 'ProduktiId') int? articleId,
    @JsonKey(name: 'Sasia') double? quantity,
    @JsonKey(name: 'Cmimi') double? price,
    @JsonKey(name: 'Rabati') double? discount,
    @JsonKey(name: 'Tvsh') double? vatValue,
    @JsonKey(name: 'IdTavolina') String? tableId,
    @JsonKey(name: 'Aktive') bool? active,
    @JsonKey(name: 'ShfrytezuesiId') int? userId,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
    @JsonKey(name: 'Fshire', fromJson: _boolFromInt) @Default(false) bool deleted,
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
    @JsonKey(name: 'DataPageses') DateTime? paymentDate,
    @JsonKey(name: 'MenyraPagesesId') int? paymentMethodId,
    @JsonKey(name: 'Totali') double? total,
    @JsonKey(name: 'ShumaPaguar') double? amountPaid,
    @JsonKey(name: 'ArkaId') int? cashRegisterId,
    @JsonKey(name: 'BankaId') int? bankId,
    @JsonKey(name: 'Referenca') String? reference,
    @JsonKey(name: 'Komenti') String? comment,
    @JsonKey(name: 'Memo') String? memo,
    @JsonKey(name: 'KrijuarNga') String? createdBy,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
    @JsonKey(name: 'Valuta') String? currency,
    @JsonKey(name: 'KursiKembimit') double? exchangeRate,
  }) = _Pagesat;

  factory Pagesat.fromJson(Map<String, dynamic> json) =>
      _$PagesatFromJson(json);
}

@freezed
class MenyraPageses with _$MenyraPageses {
  const factory MenyraPageses({
    required int id,
    @JsonKey(name: 'Kodi') String? code,
    @JsonKey(name: 'Emertimi') String? name,
    @JsonKey(name: 'Kontoja') int? account,
    @JsonKey(name: 'FiskalType') int? fiscalType,
    @JsonKey(name: 'PosEnabled') bool? posEnabled,
    @JsonKey(name: 'POSBorgji') bool? posCredit,
    @JsonKey(name: 'KontojaKalimtare') String? temporaryAccount,
    @JsonKey(name: 'KontimneKontoKalimtare') bool? useTemporaryAccount,
    @JsonKey(name: 'KontojaeProvizioneve') String? provisionAccount,
    @JsonKey(name: 'BankaId') int? bankId,
    @JsonKey(name: 'JoFiskal') bool? nonFiscal,
    @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
    @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
  }) = _MenyraPageses;

  factory MenyraPageses.fromJson(Map<String, dynamic> json) =>
      _$MenyraPagesesFromJson(json);
}

// Helper function to convert int to bool
bool _boolFromInt(dynamic value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is int) return value != 0;
  if (value is String) return value.toLowerCase() == 'true' || value == '1';
  return false;
}

// Helper function to convert string to double
double? _doubleFromString(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) {
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }
  return null;
}