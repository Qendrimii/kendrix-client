// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artikulli_baze.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtikulliBaze _$ArtikulliBazeFromJson(Map<String, dynamic> json) {
  return _ArtikulliBaze.fromJson(json);
}

/// @nodoc
mixin _$ArtikulliBaze {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Artikull')
  bool? get isArticle => throw _privateConstructorUsedError;
  @JsonKey(name: 'Sherbim')
  bool? get isService => throw _privateConstructorUsedError;
  @JsonKey(name: 'Shifra')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Emri')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Njesia')
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'Barkodi')
  String? get barcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Cmimi_I_Shitjes_Cope')
  double? get sellingPricePerPiece => throw _privateConstructorUsedError;
  @JsonKey(name: 'Cmimi_I_Shitjes_Pako')
  double? get sellingPricePerPackage => throw _privateConstructorUsedError;
  @JsonKey(name: 'SasiaPako')
  int? get packageQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'KategoriaId')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Aktiv')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'ArtikullIPerbere')
  bool? get isComposite => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmriGjenerik')
  String? get genericName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Prodhuesi')
  String? get manufacturer => throw _privateConstructorUsedError;
  @JsonKey(name: 'ArtNgaPeshorja')
  bool? get fromScale => throw _privateConstructorUsedError;
  @JsonKey(name: 'TvshId')
  int? get tvshId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmertimiiDyte')
  String? get alternativeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PeshaNeto')
  double? get netWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'PeshaBruto')
  double? get grossWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'Gjatesia')
  double? get length => throw _privateConstructorUsedError;
  @JsonKey(name: 'Gjersia')
  double? get width => throw _privateConstructorUsedError;
  @JsonKey(name: 'Lartesia')
  double? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'SasiaMinimale')
  double? get minimumQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'SasiaMaksimale')
  double? get maximumQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Afatshkurte')
  bool? get shortTerm => throw _privateConstructorUsedError;
  @JsonKey(name: 'Afatgjate')
  bool? get longTerm => throw _privateConstructorUsedError;
  @JsonKey(name: 'NormaZhvleresimit')
  double? get depreciationRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEFillimitTeZhvlersimit')
  DateTime? get depreciationStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TempId')
  int? get tempId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Skadimi')
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Ambalazhi')
  String? get packaging => throw _privateConstructorUsedError;
  @JsonKey(name: 'IRimbursueshem')
  bool? get isRefundable => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrigjinaEMallit')
  String? get origin => throw _privateConstructorUsedError;
  @JsonKey(name: 'KostoEProdhimit')
  int? get productionCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rafti')
  String? get shelf => throw _privateConstructorUsedError;
  @JsonKey(name: 'KodiDoganor')
  String? get customsCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'SubjektiId')
  int? get subjectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IncomeAccountId')
  int? get incomeAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpenseAccountId')
  int? get expenseAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsGroup')
  bool? get isGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'GroupId')
  int? get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError; // Relations
  @JsonKey(name: 'kategoria')
  Kategoria? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'tvsh')
  TVSH? get tvsh => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtikulliBazeCopyWith<ArtikulliBaze> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtikulliBazeCopyWith<$Res> {
  factory $ArtikulliBazeCopyWith(
          ArtikulliBaze value, $Res Function(ArtikulliBaze) then) =
      _$ArtikulliBazeCopyWithImpl<$Res, ArtikulliBaze>;
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'DataEFillimitTeZhvlersimit')
      DateTime? depreciationStartDate,
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
      @JsonKey(name: 'kategoria') Kategoria? category,
      @JsonKey(name: 'tvsh') TVSH? tvsh});

  $KategoriaCopyWith<$Res>? get category;
  $TVSHCopyWith<$Res>? get tvsh;
}

/// @nodoc
class _$ArtikulliBazeCopyWithImpl<$Res, $Val extends ArtikulliBaze>
    implements $ArtikulliBazeCopyWith<$Res> {
  _$ArtikulliBazeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isArticle = freezed,
    Object? isService = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? unit = freezed,
    Object? barcode = freezed,
    Object? sellingPricePerPiece = freezed,
    Object? sellingPricePerPackage = freezed,
    Object? packageQuantity = freezed,
    Object? categoryId = freezed,
    Object? active = freezed,
    Object? isComposite = freezed,
    Object? genericName = freezed,
    Object? manufacturer = freezed,
    Object? fromScale = freezed,
    Object? tvshId = freezed,
    Object? alternativeName = freezed,
    Object? netWeight = freezed,
    Object? grossWeight = freezed,
    Object? length = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? minimumQuantity = freezed,
    Object? maximumQuantity = freezed,
    Object? shortTerm = freezed,
    Object? longTerm = freezed,
    Object? depreciationRate = freezed,
    Object? depreciationStartDate = freezed,
    Object? tempId = freezed,
    Object? expiryDate = freezed,
    Object? packaging = freezed,
    Object? isRefundable = freezed,
    Object? origin = freezed,
    Object? productionCost = freezed,
    Object? shelf = freezed,
    Object? customsCode = freezed,
    Object? subjectId = freezed,
    Object? incomeAccountId = freezed,
    Object? expenseAccountId = freezed,
    Object? isGroup = freezed,
    Object? groupId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? category = freezed,
    Object? tvsh = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isArticle: freezed == isArticle
          ? _value.isArticle
          : isArticle // ignore: cast_nullable_to_non_nullable
              as bool?,
      isService: freezed == isService
          ? _value.isService
          : isService // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      sellingPricePerPiece: freezed == sellingPricePerPiece
          ? _value.sellingPricePerPiece
          : sellingPricePerPiece // ignore: cast_nullable_to_non_nullable
              as double?,
      sellingPricePerPackage: freezed == sellingPricePerPackage
          ? _value.sellingPricePerPackage
          : sellingPricePerPackage // ignore: cast_nullable_to_non_nullable
              as double?,
      packageQuantity: freezed == packageQuantity
          ? _value.packageQuantity
          : packageQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComposite: freezed == isComposite
          ? _value.isComposite
          : isComposite // ignore: cast_nullable_to_non_nullable
              as bool?,
      genericName: freezed == genericName
          ? _value.genericName
          : genericName // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      fromScale: freezed == fromScale
          ? _value.fromScale
          : fromScale // ignore: cast_nullable_to_non_nullable
              as bool?,
      tvshId: freezed == tvshId
          ? _value.tvshId
          : tvshId // ignore: cast_nullable_to_non_nullable
              as int?,
      alternativeName: freezed == alternativeName
          ? _value.alternativeName
          : alternativeName // ignore: cast_nullable_to_non_nullable
              as String?,
      netWeight: freezed == netWeight
          ? _value.netWeight
          : netWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      grossWeight: freezed == grossWeight
          ? _value.grossWeight
          : grossWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      minimumQuantity: freezed == minimumQuantity
          ? _value.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      maximumQuantity: freezed == maximumQuantity
          ? _value.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      shortTerm: freezed == shortTerm
          ? _value.shortTerm
          : shortTerm // ignore: cast_nullable_to_non_nullable
              as bool?,
      longTerm: freezed == longTerm
          ? _value.longTerm
          : longTerm // ignore: cast_nullable_to_non_nullable
              as bool?,
      depreciationRate: freezed == depreciationRate
          ? _value.depreciationRate
          : depreciationRate // ignore: cast_nullable_to_non_nullable
              as double?,
      depreciationStartDate: freezed == depreciationStartDate
          ? _value.depreciationStartDate
          : depreciationStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tempId: freezed == tempId
          ? _value.tempId
          : tempId // ignore: cast_nullable_to_non_nullable
              as int?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      packaging: freezed == packaging
          ? _value.packaging
          : packaging // ignore: cast_nullable_to_non_nullable
              as String?,
      isRefundable: freezed == isRefundable
          ? _value.isRefundable
          : isRefundable // ignore: cast_nullable_to_non_nullable
              as bool?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCost: freezed == productionCost
          ? _value.productionCost
          : productionCost // ignore: cast_nullable_to_non_nullable
              as int?,
      shelf: freezed == shelf
          ? _value.shelf
          : shelf // ignore: cast_nullable_to_non_nullable
              as String?,
      customsCode: freezed == customsCode
          ? _value.customsCode
          : customsCode // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectId: freezed == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      incomeAccountId: freezed == incomeAccountId
          ? _value.incomeAccountId
          : incomeAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      expenseAccountId: freezed == expenseAccountId
          ? _value.expenseAccountId
          : expenseAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      isGroup: freezed == isGroup
          ? _value.isGroup
          : isGroup // ignore: cast_nullable_to_non_nullable
              as bool?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Kategoria?,
      tvsh: freezed == tvsh
          ? _value.tvsh
          : tvsh // ignore: cast_nullable_to_non_nullable
              as TVSH?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KategoriaCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $KategoriaCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TVSHCopyWith<$Res>? get tvsh {
    if (_value.tvsh == null) {
      return null;
    }

    return $TVSHCopyWith<$Res>(_value.tvsh!, (value) {
      return _then(_value.copyWith(tvsh: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtikulliBazeImplCopyWith<$Res>
    implements $ArtikulliBazeCopyWith<$Res> {
  factory _$$ArtikulliBazeImplCopyWith(
          _$ArtikulliBazeImpl value, $Res Function(_$ArtikulliBazeImpl) then) =
      __$$ArtikulliBazeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'DataEFillimitTeZhvlersimit')
      DateTime? depreciationStartDate,
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
      @JsonKey(name: 'kategoria') Kategoria? category,
      @JsonKey(name: 'tvsh') TVSH? tvsh});

  @override
  $KategoriaCopyWith<$Res>? get category;
  @override
  $TVSHCopyWith<$Res>? get tvsh;
}

/// @nodoc
class __$$ArtikulliBazeImplCopyWithImpl<$Res>
    extends _$ArtikulliBazeCopyWithImpl<$Res, _$ArtikulliBazeImpl>
    implements _$$ArtikulliBazeImplCopyWith<$Res> {
  __$$ArtikulliBazeImplCopyWithImpl(
      _$ArtikulliBazeImpl _value, $Res Function(_$ArtikulliBazeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isArticle = freezed,
    Object? isService = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? unit = freezed,
    Object? barcode = freezed,
    Object? sellingPricePerPiece = freezed,
    Object? sellingPricePerPackage = freezed,
    Object? packageQuantity = freezed,
    Object? categoryId = freezed,
    Object? active = freezed,
    Object? isComposite = freezed,
    Object? genericName = freezed,
    Object? manufacturer = freezed,
    Object? fromScale = freezed,
    Object? tvshId = freezed,
    Object? alternativeName = freezed,
    Object? netWeight = freezed,
    Object? grossWeight = freezed,
    Object? length = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? minimumQuantity = freezed,
    Object? maximumQuantity = freezed,
    Object? shortTerm = freezed,
    Object? longTerm = freezed,
    Object? depreciationRate = freezed,
    Object? depreciationStartDate = freezed,
    Object? tempId = freezed,
    Object? expiryDate = freezed,
    Object? packaging = freezed,
    Object? isRefundable = freezed,
    Object? origin = freezed,
    Object? productionCost = freezed,
    Object? shelf = freezed,
    Object? customsCode = freezed,
    Object? subjectId = freezed,
    Object? incomeAccountId = freezed,
    Object? expenseAccountId = freezed,
    Object? isGroup = freezed,
    Object? groupId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? category = freezed,
    Object? tvsh = freezed,
  }) {
    return _then(_$ArtikulliBazeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isArticle: freezed == isArticle
          ? _value.isArticle
          : isArticle // ignore: cast_nullable_to_non_nullable
              as bool?,
      isService: freezed == isService
          ? _value.isService
          : isService // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      sellingPricePerPiece: freezed == sellingPricePerPiece
          ? _value.sellingPricePerPiece
          : sellingPricePerPiece // ignore: cast_nullable_to_non_nullable
              as double?,
      sellingPricePerPackage: freezed == sellingPricePerPackage
          ? _value.sellingPricePerPackage
          : sellingPricePerPackage // ignore: cast_nullable_to_non_nullable
              as double?,
      packageQuantity: freezed == packageQuantity
          ? _value.packageQuantity
          : packageQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      isComposite: freezed == isComposite
          ? _value.isComposite
          : isComposite // ignore: cast_nullable_to_non_nullable
              as bool?,
      genericName: freezed == genericName
          ? _value.genericName
          : genericName // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      fromScale: freezed == fromScale
          ? _value.fromScale
          : fromScale // ignore: cast_nullable_to_non_nullable
              as bool?,
      tvshId: freezed == tvshId
          ? _value.tvshId
          : tvshId // ignore: cast_nullable_to_non_nullable
              as int?,
      alternativeName: freezed == alternativeName
          ? _value.alternativeName
          : alternativeName // ignore: cast_nullable_to_non_nullable
              as String?,
      netWeight: freezed == netWeight
          ? _value.netWeight
          : netWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      grossWeight: freezed == grossWeight
          ? _value.grossWeight
          : grossWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      minimumQuantity: freezed == minimumQuantity
          ? _value.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      maximumQuantity: freezed == maximumQuantity
          ? _value.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      shortTerm: freezed == shortTerm
          ? _value.shortTerm
          : shortTerm // ignore: cast_nullable_to_non_nullable
              as bool?,
      longTerm: freezed == longTerm
          ? _value.longTerm
          : longTerm // ignore: cast_nullable_to_non_nullable
              as bool?,
      depreciationRate: freezed == depreciationRate
          ? _value.depreciationRate
          : depreciationRate // ignore: cast_nullable_to_non_nullable
              as double?,
      depreciationStartDate: freezed == depreciationStartDate
          ? _value.depreciationStartDate
          : depreciationStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tempId: freezed == tempId
          ? _value.tempId
          : tempId // ignore: cast_nullable_to_non_nullable
              as int?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      packaging: freezed == packaging
          ? _value.packaging
          : packaging // ignore: cast_nullable_to_non_nullable
              as String?,
      isRefundable: freezed == isRefundable
          ? _value.isRefundable
          : isRefundable // ignore: cast_nullable_to_non_nullable
              as bool?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCost: freezed == productionCost
          ? _value.productionCost
          : productionCost // ignore: cast_nullable_to_non_nullable
              as int?,
      shelf: freezed == shelf
          ? _value.shelf
          : shelf // ignore: cast_nullable_to_non_nullable
              as String?,
      customsCode: freezed == customsCode
          ? _value.customsCode
          : customsCode // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectId: freezed == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      incomeAccountId: freezed == incomeAccountId
          ? _value.incomeAccountId
          : incomeAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      expenseAccountId: freezed == expenseAccountId
          ? _value.expenseAccountId
          : expenseAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      isGroup: freezed == isGroup
          ? _value.isGroup
          : isGroup // ignore: cast_nullable_to_non_nullable
              as bool?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Kategoria?,
      tvsh: freezed == tvsh
          ? _value.tvsh
          : tvsh // ignore: cast_nullable_to_non_nullable
              as TVSH?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtikulliBazeImpl implements _ArtikulliBaze {
  const _$ArtikulliBazeImpl(
      {required this.id,
      @JsonKey(name: 'Artikull') this.isArticle,
      @JsonKey(name: 'Sherbim') this.isService,
      @JsonKey(name: 'Shifra') this.code,
      @JsonKey(name: 'Emri') this.name,
      @JsonKey(name: 'Njesia') this.unit,
      @JsonKey(name: 'Barkodi') this.barcode,
      @JsonKey(name: 'Cmimi_I_Shitjes_Cope') this.sellingPricePerPiece,
      @JsonKey(name: 'Cmimi_I_Shitjes_Pako') this.sellingPricePerPackage,
      @JsonKey(name: 'SasiaPako') this.packageQuantity,
      @JsonKey(name: 'KategoriaId') this.categoryId,
      @JsonKey(name: 'Aktiv') this.active,
      @JsonKey(name: 'ArtikullIPerbere') this.isComposite,
      @JsonKey(name: 'EmriGjenerik') this.genericName,
      @JsonKey(name: 'Prodhuesi') this.manufacturer,
      @JsonKey(name: 'ArtNgaPeshorja') this.fromScale,
      @JsonKey(name: 'TvshId') this.tvshId,
      @JsonKey(name: 'EmertimiiDyte') this.alternativeName,
      @JsonKey(name: 'PeshaNeto') this.netWeight,
      @JsonKey(name: 'PeshaBruto') this.grossWeight,
      @JsonKey(name: 'Gjatesia') this.length,
      @JsonKey(name: 'Gjersia') this.width,
      @JsonKey(name: 'Lartesia') this.height,
      @JsonKey(name: 'SasiaMinimale') this.minimumQuantity,
      @JsonKey(name: 'SasiaMaksimale') this.maximumQuantity,
      @JsonKey(name: 'Afatshkurte') this.shortTerm,
      @JsonKey(name: 'Afatgjate') this.longTerm,
      @JsonKey(name: 'NormaZhvleresimit') this.depreciationRate,
      @JsonKey(name: 'DataEFillimitTeZhvlersimit') this.depreciationStartDate,
      @JsonKey(name: 'TempId') this.tempId,
      @JsonKey(name: 'Skadimi') this.expiryDate,
      @JsonKey(name: 'Ambalazhi') this.packaging,
      @JsonKey(name: 'IRimbursueshem') this.isRefundable,
      @JsonKey(name: 'OrigjinaEMallit') this.origin,
      @JsonKey(name: 'KostoEProdhimit') this.productionCost,
      @JsonKey(name: 'Rafti') this.shelf,
      @JsonKey(name: 'KodiDoganor') this.customsCode,
      @JsonKey(name: 'SubjektiId') this.subjectId,
      @JsonKey(name: 'IncomeAccountId') this.incomeAccountId,
      @JsonKey(name: 'ExpenseAccountId') this.expenseAccountId,
      @JsonKey(name: 'IsGroup') this.isGroup,
      @JsonKey(name: 'GroupId') this.groupId,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt,
      @JsonKey(name: 'kategoria') this.category,
      @JsonKey(name: 'tvsh') this.tvsh});

  factory _$ArtikulliBazeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtikulliBazeImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'Artikull')
  final bool? isArticle;
  @override
  @JsonKey(name: 'Sherbim')
  final bool? isService;
  @override
  @JsonKey(name: 'Shifra')
  final String? code;
  @override
  @JsonKey(name: 'Emri')
  final String? name;
  @override
  @JsonKey(name: 'Njesia')
  final String? unit;
  @override
  @JsonKey(name: 'Barkodi')
  final String? barcode;
  @override
  @JsonKey(name: 'Cmimi_I_Shitjes_Cope')
  final double? sellingPricePerPiece;
  @override
  @JsonKey(name: 'Cmimi_I_Shitjes_Pako')
  final double? sellingPricePerPackage;
  @override
  @JsonKey(name: 'SasiaPako')
  final int? packageQuantity;
  @override
  @JsonKey(name: 'KategoriaId')
  final int? categoryId;
  @override
  @JsonKey(name: 'Aktiv')
  final bool? active;
  @override
  @JsonKey(name: 'ArtikullIPerbere')
  final bool? isComposite;
  @override
  @JsonKey(name: 'EmriGjenerik')
  final String? genericName;
  @override
  @JsonKey(name: 'Prodhuesi')
  final String? manufacturer;
  @override
  @JsonKey(name: 'ArtNgaPeshorja')
  final bool? fromScale;
  @override
  @JsonKey(name: 'TvshId')
  final int? tvshId;
  @override
  @JsonKey(name: 'EmertimiiDyte')
  final String? alternativeName;
  @override
  @JsonKey(name: 'PeshaNeto')
  final double? netWeight;
  @override
  @JsonKey(name: 'PeshaBruto')
  final double? grossWeight;
  @override
  @JsonKey(name: 'Gjatesia')
  final double? length;
  @override
  @JsonKey(name: 'Gjersia')
  final double? width;
  @override
  @JsonKey(name: 'Lartesia')
  final double? height;
  @override
  @JsonKey(name: 'SasiaMinimale')
  final double? minimumQuantity;
  @override
  @JsonKey(name: 'SasiaMaksimale')
  final double? maximumQuantity;
  @override
  @JsonKey(name: 'Afatshkurte')
  final bool? shortTerm;
  @override
  @JsonKey(name: 'Afatgjate')
  final bool? longTerm;
  @override
  @JsonKey(name: 'NormaZhvleresimit')
  final double? depreciationRate;
  @override
  @JsonKey(name: 'DataEFillimitTeZhvlersimit')
  final DateTime? depreciationStartDate;
  @override
  @JsonKey(name: 'TempId')
  final int? tempId;
  @override
  @JsonKey(name: 'Skadimi')
  final DateTime? expiryDate;
  @override
  @JsonKey(name: 'Ambalazhi')
  final String? packaging;
  @override
  @JsonKey(name: 'IRimbursueshem')
  final bool? isRefundable;
  @override
  @JsonKey(name: 'OrigjinaEMallit')
  final String? origin;
  @override
  @JsonKey(name: 'KostoEProdhimit')
  final int? productionCost;
  @override
  @JsonKey(name: 'Rafti')
  final String? shelf;
  @override
  @JsonKey(name: 'KodiDoganor')
  final String? customsCode;
  @override
  @JsonKey(name: 'SubjektiId')
  final int? subjectId;
  @override
  @JsonKey(name: 'IncomeAccountId')
  final int? incomeAccountId;
  @override
  @JsonKey(name: 'ExpenseAccountId')
  final int? expenseAccountId;
  @override
  @JsonKey(name: 'IsGroup')
  final bool? isGroup;
  @override
  @JsonKey(name: 'GroupId')
  final int? groupId;
  @override
  @JsonKey(name: 'DataEKrijimit')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  final DateTime? updatedAt;
// Relations
  @override
  @JsonKey(name: 'kategoria')
  final Kategoria? category;
  @override
  @JsonKey(name: 'tvsh')
  final TVSH? tvsh;

  @override
  String toString() {
    return 'ArtikulliBaze(id: $id, isArticle: $isArticle, isService: $isService, code: $code, name: $name, unit: $unit, barcode: $barcode, sellingPricePerPiece: $sellingPricePerPiece, sellingPricePerPackage: $sellingPricePerPackage, packageQuantity: $packageQuantity, categoryId: $categoryId, active: $active, isComposite: $isComposite, genericName: $genericName, manufacturer: $manufacturer, fromScale: $fromScale, tvshId: $tvshId, alternativeName: $alternativeName, netWeight: $netWeight, grossWeight: $grossWeight, length: $length, width: $width, height: $height, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, shortTerm: $shortTerm, longTerm: $longTerm, depreciationRate: $depreciationRate, depreciationStartDate: $depreciationStartDate, tempId: $tempId, expiryDate: $expiryDate, packaging: $packaging, isRefundable: $isRefundable, origin: $origin, productionCost: $productionCost, shelf: $shelf, customsCode: $customsCode, subjectId: $subjectId, incomeAccountId: $incomeAccountId, expenseAccountId: $expenseAccountId, isGroup: $isGroup, groupId: $groupId, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, tvsh: $tvsh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtikulliBazeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isArticle, isArticle) ||
                other.isArticle == isArticle) &&
            (identical(other.isService, isService) ||
                other.isService == isService) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.sellingPricePerPiece, sellingPricePerPiece) ||
                other.sellingPricePerPiece == sellingPricePerPiece) &&
            (identical(other.sellingPricePerPackage, sellingPricePerPackage) ||
                other.sellingPricePerPackage == sellingPricePerPackage) &&
            (identical(other.packageQuantity, packageQuantity) ||
                other.packageQuantity == packageQuantity) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isComposite, isComposite) ||
                other.isComposite == isComposite) &&
            (identical(other.genericName, genericName) ||
                other.genericName == genericName) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.fromScale, fromScale) ||
                other.fromScale == fromScale) &&
            (identical(other.tvshId, tvshId) || other.tvshId == tvshId) &&
            (identical(other.alternativeName, alternativeName) ||
                other.alternativeName == alternativeName) &&
            (identical(other.netWeight, netWeight) ||
                other.netWeight == netWeight) &&
            (identical(other.grossWeight, grossWeight) ||
                other.grossWeight == grossWeight) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.minimumQuantity, minimumQuantity) ||
                other.minimumQuantity == minimumQuantity) &&
            (identical(other.maximumQuantity, maximumQuantity) ||
                other.maximumQuantity == maximumQuantity) &&
            (identical(other.shortTerm, shortTerm) ||
                other.shortTerm == shortTerm) &&
            (identical(other.longTerm, longTerm) ||
                other.longTerm == longTerm) &&
            (identical(other.depreciationRate, depreciationRate) ||
                other.depreciationRate == depreciationRate) &&
            (identical(other.depreciationStartDate, depreciationStartDate) ||
                other.depreciationStartDate == depreciationStartDate) &&
            (identical(other.tempId, tempId) || other.tempId == tempId) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.packaging, packaging) ||
                other.packaging == packaging) &&
            (identical(other.isRefundable, isRefundable) ||
                other.isRefundable == isRefundable) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.productionCost, productionCost) ||
                other.productionCost == productionCost) &&
            (identical(other.shelf, shelf) || other.shelf == shelf) &&
            (identical(other.customsCode, customsCode) ||
                other.customsCode == customsCode) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.incomeAccountId, incomeAccountId) ||
                other.incomeAccountId == incomeAccountId) &&
            (identical(other.expenseAccountId, expenseAccountId) ||
                other.expenseAccountId == expenseAccountId) &&
            (identical(other.isGroup, isGroup) || other.isGroup == isGroup) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.tvsh, tvsh) || other.tvsh == tvsh));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isArticle,
        isService,
        code,
        name,
        unit,
        barcode,
        sellingPricePerPiece,
        sellingPricePerPackage,
        packageQuantity,
        categoryId,
        active,
        isComposite,
        genericName,
        manufacturer,
        fromScale,
        tvshId,
        alternativeName,
        netWeight,
        grossWeight,
        length,
        width,
        height,
        minimumQuantity,
        maximumQuantity,
        shortTerm,
        longTerm,
        depreciationRate,
        depreciationStartDate,
        tempId,
        expiryDate,
        packaging,
        isRefundable,
        origin,
        productionCost,
        shelf,
        customsCode,
        subjectId,
        incomeAccountId,
        expenseAccountId,
        isGroup,
        groupId,
        createdAt,
        updatedAt,
        category,
        tvsh
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtikulliBazeImplCopyWith<_$ArtikulliBazeImpl> get copyWith =>
      __$$ArtikulliBazeImplCopyWithImpl<_$ArtikulliBazeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtikulliBazeImplToJson(
      this,
    );
  }
}

abstract class _ArtikulliBaze implements ArtikulliBaze {
  const factory _ArtikulliBaze(
      {required final int id,
      @JsonKey(name: 'Artikull') final bool? isArticle,
      @JsonKey(name: 'Sherbim') final bool? isService,
      @JsonKey(name: 'Shifra') final String? code,
      @JsonKey(name: 'Emri') final String? name,
      @JsonKey(name: 'Njesia') final String? unit,
      @JsonKey(name: 'Barkodi') final String? barcode,
      @JsonKey(name: 'Cmimi_I_Shitjes_Cope') final double? sellingPricePerPiece,
      @JsonKey(name: 'Cmimi_I_Shitjes_Pako')
      final double? sellingPricePerPackage,
      @JsonKey(name: 'SasiaPako') final int? packageQuantity,
      @JsonKey(name: 'KategoriaId') final int? categoryId,
      @JsonKey(name: 'Aktiv') final bool? active,
      @JsonKey(name: 'ArtikullIPerbere') final bool? isComposite,
      @JsonKey(name: 'EmriGjenerik') final String? genericName,
      @JsonKey(name: 'Prodhuesi') final String? manufacturer,
      @JsonKey(name: 'ArtNgaPeshorja') final bool? fromScale,
      @JsonKey(name: 'TvshId') final int? tvshId,
      @JsonKey(name: 'EmertimiiDyte') final String? alternativeName,
      @JsonKey(name: 'PeshaNeto') final double? netWeight,
      @JsonKey(name: 'PeshaBruto') final double? grossWeight,
      @JsonKey(name: 'Gjatesia') final double? length,
      @JsonKey(name: 'Gjersia') final double? width,
      @JsonKey(name: 'Lartesia') final double? height,
      @JsonKey(name: 'SasiaMinimale') final double? minimumQuantity,
      @JsonKey(name: 'SasiaMaksimale') final double? maximumQuantity,
      @JsonKey(name: 'Afatshkurte') final bool? shortTerm,
      @JsonKey(name: 'Afatgjate') final bool? longTerm,
      @JsonKey(name: 'NormaZhvleresimit') final double? depreciationRate,
      @JsonKey(name: 'DataEFillimitTeZhvlersimit')
      final DateTime? depreciationStartDate,
      @JsonKey(name: 'TempId') final int? tempId,
      @JsonKey(name: 'Skadimi') final DateTime? expiryDate,
      @JsonKey(name: 'Ambalazhi') final String? packaging,
      @JsonKey(name: 'IRimbursueshem') final bool? isRefundable,
      @JsonKey(name: 'OrigjinaEMallit') final String? origin,
      @JsonKey(name: 'KostoEProdhimit') final int? productionCost,
      @JsonKey(name: 'Rafti') final String? shelf,
      @JsonKey(name: 'KodiDoganor') final String? customsCode,
      @JsonKey(name: 'SubjektiId') final int? subjectId,
      @JsonKey(name: 'IncomeAccountId') final int? incomeAccountId,
      @JsonKey(name: 'ExpenseAccountId') final int? expenseAccountId,
      @JsonKey(name: 'IsGroup') final bool? isGroup,
      @JsonKey(name: 'GroupId') final int? groupId,
      @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt,
      @JsonKey(name: 'kategoria') final Kategoria? category,
      @JsonKey(name: 'tvsh') final TVSH? tvsh}) = _$ArtikulliBazeImpl;

  factory _ArtikulliBaze.fromJson(Map<String, dynamic> json) =
      _$ArtikulliBazeImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'Artikull')
  bool? get isArticle;
  @override
  @JsonKey(name: 'Sherbim')
  bool? get isService;
  @override
  @JsonKey(name: 'Shifra')
  String? get code;
  @override
  @JsonKey(name: 'Emri')
  String? get name;
  @override
  @JsonKey(name: 'Njesia')
  String? get unit;
  @override
  @JsonKey(name: 'Barkodi')
  String? get barcode;
  @override
  @JsonKey(name: 'Cmimi_I_Shitjes_Cope')
  double? get sellingPricePerPiece;
  @override
  @JsonKey(name: 'Cmimi_I_Shitjes_Pako')
  double? get sellingPricePerPackage;
  @override
  @JsonKey(name: 'SasiaPako')
  int? get packageQuantity;
  @override
  @JsonKey(name: 'KategoriaId')
  int? get categoryId;
  @override
  @JsonKey(name: 'Aktiv')
  bool? get active;
  @override
  @JsonKey(name: 'ArtikullIPerbere')
  bool? get isComposite;
  @override
  @JsonKey(name: 'EmriGjenerik')
  String? get genericName;
  @override
  @JsonKey(name: 'Prodhuesi')
  String? get manufacturer;
  @override
  @JsonKey(name: 'ArtNgaPeshorja')
  bool? get fromScale;
  @override
  @JsonKey(name: 'TvshId')
  int? get tvshId;
  @override
  @JsonKey(name: 'EmertimiiDyte')
  String? get alternativeName;
  @override
  @JsonKey(name: 'PeshaNeto')
  double? get netWeight;
  @override
  @JsonKey(name: 'PeshaBruto')
  double? get grossWeight;
  @override
  @JsonKey(name: 'Gjatesia')
  double? get length;
  @override
  @JsonKey(name: 'Gjersia')
  double? get width;
  @override
  @JsonKey(name: 'Lartesia')
  double? get height;
  @override
  @JsonKey(name: 'SasiaMinimale')
  double? get minimumQuantity;
  @override
  @JsonKey(name: 'SasiaMaksimale')
  double? get maximumQuantity;
  @override
  @JsonKey(name: 'Afatshkurte')
  bool? get shortTerm;
  @override
  @JsonKey(name: 'Afatgjate')
  bool? get longTerm;
  @override
  @JsonKey(name: 'NormaZhvleresimit')
  double? get depreciationRate;
  @override
  @JsonKey(name: 'DataEFillimitTeZhvlersimit')
  DateTime? get depreciationStartDate;
  @override
  @JsonKey(name: 'TempId')
  int? get tempId;
  @override
  @JsonKey(name: 'Skadimi')
  DateTime? get expiryDate;
  @override
  @JsonKey(name: 'Ambalazhi')
  String? get packaging;
  @override
  @JsonKey(name: 'IRimbursueshem')
  bool? get isRefundable;
  @override
  @JsonKey(name: 'OrigjinaEMallit')
  String? get origin;
  @override
  @JsonKey(name: 'KostoEProdhimit')
  int? get productionCost;
  @override
  @JsonKey(name: 'Rafti')
  String? get shelf;
  @override
  @JsonKey(name: 'KodiDoganor')
  String? get customsCode;
  @override
  @JsonKey(name: 'SubjektiId')
  int? get subjectId;
  @override
  @JsonKey(name: 'IncomeAccountId')
  int? get incomeAccountId;
  @override
  @JsonKey(name: 'ExpenseAccountId')
  int? get expenseAccountId;
  @override
  @JsonKey(name: 'IsGroup')
  bool? get isGroup;
  @override
  @JsonKey(name: 'GroupId')
  int? get groupId;
  @override
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt;
  @override // Relations
  @JsonKey(name: 'kategoria')
  Kategoria? get category;
  @override
  @JsonKey(name: 'tvsh')
  TVSH? get tvsh;
  @override
  @JsonKey(ignore: true)
  _$$ArtikulliBazeImplCopyWith<_$ArtikulliBazeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Kategoria _$KategoriaFromJson(Map<String, dynamic> json) {
  return _Kategoria.fromJson(json);
}

/// @nodoc
mixin _$Kategoria {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Emri')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Color')
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'Printer')
  String? get printer => throw _privateConstructorUsedError;
  @JsonKey(name: 'Lloji')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmriNePrinter')
  String? get printerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KategoriaCopyWith<Kategoria> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KategoriaCopyWith<$Res> {
  factory $KategoriaCopyWith(Kategoria value, $Res Function(Kategoria) then) =
      _$KategoriaCopyWithImpl<$Res, Kategoria>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'Emri') String? name,
      @JsonKey(name: 'Color') String? color,
      @JsonKey(name: 'Printer') String? printer,
      @JsonKey(name: 'Lloji') int? type,
      @JsonKey(name: 'EmriNePrinter') String? printerName,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt});
}

/// @nodoc
class _$KategoriaCopyWithImpl<$Res, $Val extends Kategoria>
    implements $KategoriaCopyWith<$Res> {
  _$KategoriaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? color = freezed,
    Object? printer = freezed,
    Object? type = freezed,
    Object? printerName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      printer: freezed == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      printerName: freezed == printerName
          ? _value.printerName
          : printerName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KategoriaImplCopyWith<$Res>
    implements $KategoriaCopyWith<$Res> {
  factory _$$KategoriaImplCopyWith(
          _$KategoriaImpl value, $Res Function(_$KategoriaImpl) then) =
      __$$KategoriaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'Emri') String? name,
      @JsonKey(name: 'Color') String? color,
      @JsonKey(name: 'Printer') String? printer,
      @JsonKey(name: 'Lloji') int? type,
      @JsonKey(name: 'EmriNePrinter') String? printerName,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt});
}

/// @nodoc
class __$$KategoriaImplCopyWithImpl<$Res>
    extends _$KategoriaCopyWithImpl<$Res, _$KategoriaImpl>
    implements _$$KategoriaImplCopyWith<$Res> {
  __$$KategoriaImplCopyWithImpl(
      _$KategoriaImpl _value, $Res Function(_$KategoriaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? color = freezed,
    Object? printer = freezed,
    Object? type = freezed,
    Object? printerName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$KategoriaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      printer: freezed == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      printerName: freezed == printerName
          ? _value.printerName
          : printerName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KategoriaImpl implements _Kategoria {
  const _$KategoriaImpl(
      {required this.id,
      @JsonKey(name: 'Emri') this.name,
      @JsonKey(name: 'Color') this.color,
      @JsonKey(name: 'Printer') this.printer,
      @JsonKey(name: 'Lloji') this.type,
      @JsonKey(name: 'EmriNePrinter') this.printerName,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt});

  factory _$KategoriaImpl.fromJson(Map<String, dynamic> json) =>
      _$$KategoriaImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'Emri')
  final String? name;
  @override
  @JsonKey(name: 'Color')
  final String? color;
  @override
  @JsonKey(name: 'Printer')
  final String? printer;
  @override
  @JsonKey(name: 'Lloji')
  final int? type;
  @override
  @JsonKey(name: 'EmriNePrinter')
  final String? printerName;
  @override
  @JsonKey(name: 'DataEKrijimit')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Kategoria(id: $id, name: $name, color: $color, printer: $printer, type: $type, printerName: $printerName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KategoriaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.printer, printer) || other.printer == printer) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.printerName, printerName) ||
                other.printerName == printerName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color, printer, type,
      printerName, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KategoriaImplCopyWith<_$KategoriaImpl> get copyWith =>
      __$$KategoriaImplCopyWithImpl<_$KategoriaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KategoriaImplToJson(
      this,
    );
  }
}

abstract class _Kategoria implements Kategoria {
  const factory _Kategoria(
          {required final int id,
          @JsonKey(name: 'Emri') final String? name,
          @JsonKey(name: 'Color') final String? color,
          @JsonKey(name: 'Printer') final String? printer,
          @JsonKey(name: 'Lloji') final int? type,
          @JsonKey(name: 'EmriNePrinter') final String? printerName,
          @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
          @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt}) =
      _$KategoriaImpl;

  factory _Kategoria.fromJson(Map<String, dynamic> json) =
      _$KategoriaImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'Emri')
  String? get name;
  @override
  @JsonKey(name: 'Color')
  String? get color;
  @override
  @JsonKey(name: 'Printer')
  String? get printer;
  @override
  @JsonKey(name: 'Lloji')
  int? get type;
  @override
  @JsonKey(name: 'EmriNePrinter')
  String? get printerName;
  @override
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$KategoriaImplCopyWith<_$KategoriaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TVSH _$TVSHFromJson(Map<String, dynamic> json) {
  return _TVSH.fromJson(json);
}

/// @nodoc
mixin _$TVSH {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Perqindja')
  double? get percentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'Grupi')
  String? get group => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fshire')
  bool? get deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TVSHCopyWith<TVSH> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TVSHCopyWith<$Res> {
  factory $TVSHCopyWith(TVSH value, $Res Function(TVSH) then) =
      _$TVSHCopyWithImpl<$Res, TVSH>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'Perqindja') double? percentage,
      @JsonKey(name: 'Grupi') String? group,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
      @JsonKey(name: 'Fshire') bool? deleted});
}

/// @nodoc
class _$TVSHCopyWithImpl<$Res, $Val extends TVSH>
    implements $TVSHCopyWith<$Res> {
  _$TVSHCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? percentage = freezed,
    Object? group = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deleted: freezed == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TVSHImplCopyWith<$Res> implements $TVSHCopyWith<$Res> {
  factory _$$TVSHImplCopyWith(
          _$TVSHImpl value, $Res Function(_$TVSHImpl) then) =
      __$$TVSHImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'Perqindja') double? percentage,
      @JsonKey(name: 'Grupi') String? group,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
      @JsonKey(name: 'Fshire') bool? deleted});
}

/// @nodoc
class __$$TVSHImplCopyWithImpl<$Res>
    extends _$TVSHCopyWithImpl<$Res, _$TVSHImpl>
    implements _$$TVSHImplCopyWith<$Res> {
  __$$TVSHImplCopyWithImpl(_$TVSHImpl _value, $Res Function(_$TVSHImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? percentage = freezed,
    Object? group = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = freezed,
  }) {
    return _then(_$TVSHImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deleted: freezed == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TVSHImpl implements _TVSH {
  const _$TVSHImpl(
      {required this.id,
      @JsonKey(name: 'Perqindja') this.percentage,
      @JsonKey(name: 'Grupi') this.group,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt,
      @JsonKey(name: 'Fshire') this.deleted});

  factory _$TVSHImpl.fromJson(Map<String, dynamic> json) =>
      _$$TVSHImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'Perqindja')
  final double? percentage;
  @override
  @JsonKey(name: 'Grupi')
  final String? group;
  @override
  @JsonKey(name: 'DataEKrijimit')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'Fshire')
  final bool? deleted;

  @override
  String toString() {
    return 'TVSH(id: $id, percentage: $percentage, group: $group, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TVSHImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, percentage, group, createdAt, updatedAt, deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TVSHImplCopyWith<_$TVSHImpl> get copyWith =>
      __$$TVSHImplCopyWithImpl<_$TVSHImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TVSHImplToJson(
      this,
    );
  }
}

abstract class _TVSH implements TVSH {
  const factory _TVSH(
      {required final int id,
      @JsonKey(name: 'Perqindja') final double? percentage,
      @JsonKey(name: 'Grupi') final String? group,
      @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt,
      @JsonKey(name: 'Fshire') final bool? deleted}) = _$TVSHImpl;

  factory _TVSH.fromJson(Map<String, dynamic> json) = _$TVSHImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'Perqindja')
  double? get percentage;
  @override
  @JsonKey(name: 'Grupi')
  String? get group;
  @override
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'Fshire')
  bool? get deleted;
  @override
  @JsonKey(ignore: true)
  _$$TVSHImplCopyWith<_$TVSHImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
