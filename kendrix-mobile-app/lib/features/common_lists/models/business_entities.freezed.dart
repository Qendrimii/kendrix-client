// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Stoku _$StokuFromJson(Map<String, dynamic> json) {
  return _Stoku.fromJson(json);
}

/// @nodoc
mixin _$Stoku {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProduktiId')
  int? get articleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Sasia')
  double? get quantityInStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'LevelIRenditjes')
  int? get reorderLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'Lokacioni')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fshire')
  bool? get deleted => throw _privateConstructorUsedError; // Relations
  @JsonKey(name: 'artikulli_baze')
  ArtikulliBaze? get article => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StokuCopyWith<Stoku> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StokuCopyWith<$Res> {
  factory $StokuCopyWith(Stoku value, $Res Function(Stoku) then) =
      _$StokuCopyWithImpl<$Res, Stoku>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'ProduktiId') int? articleId,
      @JsonKey(name: 'Sasia') double? quantityInStock,
      @JsonKey(name: 'LevelIRenditjes') int? reorderLevel,
      @JsonKey(name: 'Lokacioni') String? location,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
      @JsonKey(name: 'Fshire') bool? deleted,
      @JsonKey(name: 'artikulli_baze') ArtikulliBaze? article});

  $ArtikulliBazeCopyWith<$Res>? get article;
}

/// @nodoc
class _$StokuCopyWithImpl<$Res, $Val extends Stoku>
    implements $StokuCopyWith<$Res> {
  _$StokuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? articleId = freezed,
    Object? quantityInStock = freezed,
    Object? reorderLevel = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = freezed,
    Object? article = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityInStock: freezed == quantityInStock
          ? _value.quantityInStock
          : quantityInStock // ignore: cast_nullable_to_non_nullable
              as double?,
      reorderLevel: freezed == reorderLevel
          ? _value.reorderLevel
          : reorderLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
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
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ArtikulliBaze?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtikulliBazeCopyWith<$Res>? get article {
    if (_value.article == null) {
      return null;
    }

    return $ArtikulliBazeCopyWith<$Res>(_value.article!, (value) {
      return _then(_value.copyWith(article: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StokuImplCopyWith<$Res> implements $StokuCopyWith<$Res> {
  factory _$$StokuImplCopyWith(
          _$StokuImpl value, $Res Function(_$StokuImpl) then) =
      __$$StokuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'ProduktiId') int? articleId,
      @JsonKey(name: 'Sasia') double? quantityInStock,
      @JsonKey(name: 'LevelIRenditjes') int? reorderLevel,
      @JsonKey(name: 'Lokacioni') String? location,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
      @JsonKey(name: 'Fshire') bool? deleted,
      @JsonKey(name: 'artikulli_baze') ArtikulliBaze? article});

  @override
  $ArtikulliBazeCopyWith<$Res>? get article;
}

/// @nodoc
class __$$StokuImplCopyWithImpl<$Res>
    extends _$StokuCopyWithImpl<$Res, _$StokuImpl>
    implements _$$StokuImplCopyWith<$Res> {
  __$$StokuImplCopyWithImpl(
      _$StokuImpl _value, $Res Function(_$StokuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? articleId = freezed,
    Object? quantityInStock = freezed,
    Object? reorderLevel = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = freezed,
    Object? article = freezed,
  }) {
    return _then(_$StokuImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityInStock: freezed == quantityInStock
          ? _value.quantityInStock
          : quantityInStock // ignore: cast_nullable_to_non_nullable
              as double?,
      reorderLevel: freezed == reorderLevel
          ? _value.reorderLevel
          : reorderLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
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
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ArtikulliBaze?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StokuImpl implements _Stoku {
  const _$StokuImpl(
      {required this.id,
      @JsonKey(name: 'ProduktiId') this.articleId,
      @JsonKey(name: 'Sasia') this.quantityInStock,
      @JsonKey(name: 'LevelIRenditjes') this.reorderLevel,
      @JsonKey(name: 'Lokacioni') this.location,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt,
      @JsonKey(name: 'Fshire') this.deleted,
      @JsonKey(name: 'artikulli_baze') this.article});

  factory _$StokuImpl.fromJson(Map<String, dynamic> json) =>
      _$$StokuImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'ProduktiId')
  final int? articleId;
  @override
  @JsonKey(name: 'Sasia')
  final double? quantityInStock;
  @override
  @JsonKey(name: 'LevelIRenditjes')
  final int? reorderLevel;
  @override
  @JsonKey(name: 'Lokacioni')
  final String? location;
  @override
  @JsonKey(name: 'DataEKrijimit')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'Fshire')
  final bool? deleted;
// Relations
  @override
  @JsonKey(name: 'artikulli_baze')
  final ArtikulliBaze? article;

  @override
  String toString() {
    return 'Stoku(id: $id, articleId: $articleId, quantityInStock: $quantityInStock, reorderLevel: $reorderLevel, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted, article: $article)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StokuImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.quantityInStock, quantityInStock) ||
                other.quantityInStock == quantityInStock) &&
            (identical(other.reorderLevel, reorderLevel) ||
                other.reorderLevel == reorderLevel) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.article, article) || other.article == article));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, articleId, quantityInStock,
      reorderLevel, location, createdAt, updatedAt, deleted, article);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StokuImplCopyWith<_$StokuImpl> get copyWith =>
      __$$StokuImplCopyWithImpl<_$StokuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StokuImplToJson(
      this,
    );
  }
}

abstract class _Stoku implements Stoku {
  const factory _Stoku(
          {required final int id,
          @JsonKey(name: 'ProduktiId') final int? articleId,
          @JsonKey(name: 'Sasia') final double? quantityInStock,
          @JsonKey(name: 'LevelIRenditjes') final int? reorderLevel,
          @JsonKey(name: 'Lokacioni') final String? location,
          @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
          @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt,
          @JsonKey(name: 'Fshire') final bool? deleted,
          @JsonKey(name: 'artikulli_baze') final ArtikulliBaze? article}) =
      _$StokuImpl;

  factory _Stoku.fromJson(Map<String, dynamic> json) = _$StokuImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'ProduktiId')
  int? get articleId;
  @override
  @JsonKey(name: 'Sasia')
  double? get quantityInStock;
  @override
  @JsonKey(name: 'LevelIRenditjes')
  int? get reorderLevel;
  @override
  @JsonKey(name: 'Lokacioni')
  String? get location;
  @override
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'Fshire')
  bool? get deleted;
  @override // Relations
  @JsonKey(name: 'artikulli_baze')
  ArtikulliBaze? get article;
  @override
  @JsonKey(ignore: true)
  _$$StokuImplCopyWith<_$StokuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaterializedDaily _$MaterializedDailyFromJson(Map<String, dynamic> json) {
  return _MaterializedDaily.fromJson(json);
}

/// @nodoc
mixin _$MaterializedDaily {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Ymd')
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'SalesNet')
  double? get salesNet => throw _privateConstructorUsedError;
  @JsonKey(name: 'SalesVat')
  double? get salesVat => throw _privateConstructorUsedError;
  @JsonKey(name: 'PurchasesNet')
  double? get purchasesNet => throw _privateConstructorUsedError;
  @JsonKey(name: 'PurchasesVat')
  double? get purchasesVat => throw _privateConstructorUsedError;
  @JsonKey(name: 'AvgTicket')
  double? get averageTicket => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterializedDailyCopyWith<MaterializedDaily> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterializedDailyCopyWith<$Res> {
  factory $MaterializedDailyCopyWith(
          MaterializedDaily value, $Res Function(MaterializedDaily) then) =
      _$MaterializedDailyCopyWithImpl<$Res, MaterializedDaily>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'Ymd') DateTime? date,
      @JsonKey(name: 'SalesNet') double? salesNet,
      @JsonKey(name: 'SalesVat') double? salesVat,
      @JsonKey(name: 'PurchasesNet') double? purchasesNet,
      @JsonKey(name: 'PurchasesVat') double? purchasesVat,
      @JsonKey(name: 'AvgTicket') double? averageTicket});
}

/// @nodoc
class _$MaterializedDailyCopyWithImpl<$Res, $Val extends MaterializedDaily>
    implements $MaterializedDailyCopyWith<$Res> {
  _$MaterializedDailyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = freezed,
    Object? salesNet = freezed,
    Object? salesVat = freezed,
    Object? purchasesNet = freezed,
    Object? purchasesVat = freezed,
    Object? averageTicket = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      salesNet: freezed == salesNet
          ? _value.salesNet
          : salesNet // ignore: cast_nullable_to_non_nullable
              as double?,
      salesVat: freezed == salesVat
          ? _value.salesVat
          : salesVat // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasesNet: freezed == purchasesNet
          ? _value.purchasesNet
          : purchasesNet // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasesVat: freezed == purchasesVat
          ? _value.purchasesVat
          : purchasesVat // ignore: cast_nullable_to_non_nullable
              as double?,
      averageTicket: freezed == averageTicket
          ? _value.averageTicket
          : averageTicket // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterializedDailyImplCopyWith<$Res>
    implements $MaterializedDailyCopyWith<$Res> {
  factory _$$MaterializedDailyImplCopyWith(_$MaterializedDailyImpl value,
          $Res Function(_$MaterializedDailyImpl) then) =
      __$$MaterializedDailyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'Ymd') DateTime? date,
      @JsonKey(name: 'SalesNet') double? salesNet,
      @JsonKey(name: 'SalesVat') double? salesVat,
      @JsonKey(name: 'PurchasesNet') double? purchasesNet,
      @JsonKey(name: 'PurchasesVat') double? purchasesVat,
      @JsonKey(name: 'AvgTicket') double? averageTicket});
}

/// @nodoc
class __$$MaterializedDailyImplCopyWithImpl<$Res>
    extends _$MaterializedDailyCopyWithImpl<$Res, _$MaterializedDailyImpl>
    implements _$$MaterializedDailyImplCopyWith<$Res> {
  __$$MaterializedDailyImplCopyWithImpl(_$MaterializedDailyImpl _value,
      $Res Function(_$MaterializedDailyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = freezed,
    Object? salesNet = freezed,
    Object? salesVat = freezed,
    Object? purchasesNet = freezed,
    Object? purchasesVat = freezed,
    Object? averageTicket = freezed,
  }) {
    return _then(_$MaterializedDailyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      salesNet: freezed == salesNet
          ? _value.salesNet
          : salesNet // ignore: cast_nullable_to_non_nullable
              as double?,
      salesVat: freezed == salesVat
          ? _value.salesVat
          : salesVat // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasesNet: freezed == purchasesNet
          ? _value.purchasesNet
          : purchasesNet // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasesVat: freezed == purchasesVat
          ? _value.purchasesVat
          : purchasesVat // ignore: cast_nullable_to_non_nullable
              as double?,
      averageTicket: freezed == averageTicket
          ? _value.averageTicket
          : averageTicket // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterializedDailyImpl implements _MaterializedDaily {
  const _$MaterializedDailyImpl(
      {required this.id,
      @JsonKey(name: 'Ymd') this.date,
      @JsonKey(name: 'SalesNet') this.salesNet,
      @JsonKey(name: 'SalesVat') this.salesVat,
      @JsonKey(name: 'PurchasesNet') this.purchasesNet,
      @JsonKey(name: 'PurchasesVat') this.purchasesVat,
      @JsonKey(name: 'AvgTicket') this.averageTicket});

  factory _$MaterializedDailyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterializedDailyImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'Ymd')
  final DateTime? date;
  @override
  @JsonKey(name: 'SalesNet')
  final double? salesNet;
  @override
  @JsonKey(name: 'SalesVat')
  final double? salesVat;
  @override
  @JsonKey(name: 'PurchasesNet')
  final double? purchasesNet;
  @override
  @JsonKey(name: 'PurchasesVat')
  final double? purchasesVat;
  @override
  @JsonKey(name: 'AvgTicket')
  final double? averageTicket;

  @override
  String toString() {
    return 'MaterializedDaily(id: $id, date: $date, salesNet: $salesNet, salesVat: $salesVat, purchasesNet: $purchasesNet, purchasesVat: $purchasesVat, averageTicket: $averageTicket)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterializedDailyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.salesNet, salesNet) ||
                other.salesNet == salesNet) &&
            (identical(other.salesVat, salesVat) ||
                other.salesVat == salesVat) &&
            (identical(other.purchasesNet, purchasesNet) ||
                other.purchasesNet == purchasesNet) &&
            (identical(other.purchasesVat, purchasesVat) ||
                other.purchasesVat == purchasesVat) &&
            (identical(other.averageTicket, averageTicket) ||
                other.averageTicket == averageTicket));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, salesNet, salesVat,
      purchasesNet, purchasesVat, averageTicket);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterializedDailyImplCopyWith<_$MaterializedDailyImpl> get copyWith =>
      __$$MaterializedDailyImplCopyWithImpl<_$MaterializedDailyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterializedDailyImplToJson(
      this,
    );
  }
}

abstract class _MaterializedDaily implements MaterializedDaily {
  const factory _MaterializedDaily(
          {required final int id,
          @JsonKey(name: 'Ymd') final DateTime? date,
          @JsonKey(name: 'SalesNet') final double? salesNet,
          @JsonKey(name: 'SalesVat') final double? salesVat,
          @JsonKey(name: 'PurchasesNet') final double? purchasesNet,
          @JsonKey(name: 'PurchasesVat') final double? purchasesVat,
          @JsonKey(name: 'AvgTicket') final double? averageTicket}) =
      _$MaterializedDailyImpl;

  factory _MaterializedDaily.fromJson(Map<String, dynamic> json) =
      _$MaterializedDailyImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'Ymd')
  DateTime? get date;
  @override
  @JsonKey(name: 'SalesNet')
  double? get salesNet;
  @override
  @JsonKey(name: 'SalesVat')
  double? get salesVat;
  @override
  @JsonKey(name: 'PurchasesNet')
  double? get purchasesNet;
  @override
  @JsonKey(name: 'PurchasesVat')
  double? get purchasesVat;
  @override
  @JsonKey(name: 'AvgTicket')
  double? get averageTicket;
  @override
  @JsonKey(ignore: true)
  _$$MaterializedDailyImplCopyWith<_$MaterializedDailyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Normativa _$NormativaFromJson(Map<String, dynamic> json) {
  return _Normativa.fromJson(json);
}

/// @nodoc
mixin _$Normativa {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'emri')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'pershkrimi')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'vlera')
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'tipi')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'aktiv')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NormativaCopyWith<Normativa> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NormativaCopyWith<$Res> {
  factory $NormativaCopyWith(Normativa value, $Res Function(Normativa) then) =
      _$NormativaCopyWithImpl<$Res, Normativa>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'emri') String? name,
      @JsonKey(name: 'pershkrimi') String? description,
      @JsonKey(name: 'vlera') String? value,
      @JsonKey(name: 'tipi') String? type,
      @JsonKey(name: 'aktiv') bool? active,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$NormativaCopyWithImpl<$Res, $Val extends Normativa>
    implements $NormativaCopyWith<$Res> {
  _$NormativaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? value = freezed,
    Object? type = freezed,
    Object? active = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$NormativaImplCopyWith<$Res>
    implements $NormativaCopyWith<$Res> {
  factory _$$NormativaImplCopyWith(
          _$NormativaImpl value, $Res Function(_$NormativaImpl) then) =
      __$$NormativaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'emri') String? name,
      @JsonKey(name: 'pershkrimi') String? description,
      @JsonKey(name: 'vlera') String? value,
      @JsonKey(name: 'tipi') String? type,
      @JsonKey(name: 'aktiv') bool? active,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$NormativaImplCopyWithImpl<$Res>
    extends _$NormativaCopyWithImpl<$Res, _$NormativaImpl>
    implements _$$NormativaImplCopyWith<$Res> {
  __$$NormativaImplCopyWithImpl(
      _$NormativaImpl _value, $Res Function(_$NormativaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? value = freezed,
    Object? type = freezed,
    Object? active = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$NormativaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$NormativaImpl implements _Normativa {
  const _$NormativaImpl(
      {required this.id,
      @JsonKey(name: 'emri') this.name,
      @JsonKey(name: 'pershkrimi') this.description,
      @JsonKey(name: 'vlera') this.value,
      @JsonKey(name: 'tipi') this.type,
      @JsonKey(name: 'aktiv') this.active,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$NormativaImpl.fromJson(Map<String, dynamic> json) =>
      _$$NormativaImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'emri')
  final String? name;
  @override
  @JsonKey(name: 'pershkrimi')
  final String? description;
  @override
  @JsonKey(name: 'vlera')
  final String? value;
  @override
  @JsonKey(name: 'tipi')
  final String? type;
  @override
  @JsonKey(name: 'aktiv')
  final bool? active;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Normativa(id: $id, name: $name, description: $description, value: $value, type: $type, active: $active, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormativaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, value,
      type, active, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NormativaImplCopyWith<_$NormativaImpl> get copyWith =>
      __$$NormativaImplCopyWithImpl<_$NormativaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NormativaImplToJson(
      this,
    );
  }
}

abstract class _Normativa implements Normativa {
  const factory _Normativa(
          {required final int id,
          @JsonKey(name: 'emri') final String? name,
          @JsonKey(name: 'pershkrimi') final String? description,
          @JsonKey(name: 'vlera') final String? value,
          @JsonKey(name: 'tipi') final String? type,
          @JsonKey(name: 'aktiv') final bool? active,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$NormativaImpl;

  factory _Normativa.fromJson(Map<String, dynamic> json) =
      _$NormativaImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'emri')
  String? get name;
  @override
  @JsonKey(name: 'pershkrimi')
  String? get description;
  @override
  @JsonKey(name: 'vlera')
  String? get value;
  @override
  @JsonKey(name: 'tipi')
  String? get type;
  @override
  @JsonKey(name: 'aktiv')
  bool? get active;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$NormativaImplCopyWith<_$NormativaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tavolina _$TavolinaFromJson(Map<String, dynamic> json) {
  return _Tavolina.fromJson(json);
}

/// @nodoc
mixin _$Tavolina {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'emri')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'pershkrimi')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'kapaciteti')
  int? get capacity => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusi')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'aktiv')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TavolinaCopyWith<Tavolina> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TavolinaCopyWith<$Res> {
  factory $TavolinaCopyWith(Tavolina value, $Res Function(Tavolina) then) =
      _$TavolinaCopyWithImpl<$Res, Tavolina>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'emri') String? name,
      @JsonKey(name: 'pershkrimi') String? description,
      @JsonKey(name: 'kapaciteti') int? capacity,
      @JsonKey(name: 'statusi') String? status,
      @JsonKey(name: 'aktiv') bool? active,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$TavolinaCopyWithImpl<$Res, $Val extends Tavolina>
    implements $TavolinaCopyWith<$Res> {
  _$TavolinaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? capacity = freezed,
    Object? status = freezed,
    Object? active = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$TavolinaImplCopyWith<$Res>
    implements $TavolinaCopyWith<$Res> {
  factory _$$TavolinaImplCopyWith(
          _$TavolinaImpl value, $Res Function(_$TavolinaImpl) then) =
      __$$TavolinaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'emri') String? name,
      @JsonKey(name: 'pershkrimi') String? description,
      @JsonKey(name: 'kapaciteti') int? capacity,
      @JsonKey(name: 'statusi') String? status,
      @JsonKey(name: 'aktiv') bool? active,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$TavolinaImplCopyWithImpl<$Res>
    extends _$TavolinaCopyWithImpl<$Res, _$TavolinaImpl>
    implements _$$TavolinaImplCopyWith<$Res> {
  __$$TavolinaImplCopyWithImpl(
      _$TavolinaImpl _value, $Res Function(_$TavolinaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? capacity = freezed,
    Object? status = freezed,
    Object? active = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TavolinaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$TavolinaImpl implements _Tavolina {
  const _$TavolinaImpl(
      {required this.id,
      @JsonKey(name: 'emri') this.name,
      @JsonKey(name: 'pershkrimi') this.description,
      @JsonKey(name: 'kapaciteti') this.capacity,
      @JsonKey(name: 'statusi') this.status,
      @JsonKey(name: 'aktiv') this.active,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$TavolinaImpl.fromJson(Map<String, dynamic> json) =>
      _$$TavolinaImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'emri')
  final String? name;
  @override
  @JsonKey(name: 'pershkrimi')
  final String? description;
  @override
  @JsonKey(name: 'kapaciteti')
  final int? capacity;
  @override
  @JsonKey(name: 'statusi')
  final String? status;
  @override
  @JsonKey(name: 'aktiv')
  final bool? active;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Tavolina(id: $id, name: $name, description: $description, capacity: $capacity, status: $status, active: $active, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TavolinaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, capacity,
      status, active, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TavolinaImplCopyWith<_$TavolinaImpl> get copyWith =>
      __$$TavolinaImplCopyWithImpl<_$TavolinaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TavolinaImplToJson(
      this,
    );
  }
}

abstract class _Tavolina implements Tavolina {
  const factory _Tavolina(
      {required final int id,
      @JsonKey(name: 'emri') final String? name,
      @JsonKey(name: 'pershkrimi') final String? description,
      @JsonKey(name: 'kapaciteti') final int? capacity,
      @JsonKey(name: 'statusi') final String? status,
      @JsonKey(name: 'aktiv') final bool? active,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$TavolinaImpl;

  factory _Tavolina.fromJson(Map<String, dynamic> json) =
      _$TavolinaImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'emri')
  String? get name;
  @override
  @JsonKey(name: 'pershkrimi')
  String? get description;
  @override
  @JsonKey(name: 'kapaciteti')
  int? get capacity;
  @override
  @JsonKey(name: 'statusi')
  String? get status;
  @override
  @JsonKey(name: 'aktiv')
  bool? get active;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TavolinaImplCopyWith<_$TavolinaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ZRaportet _$ZRaportetFromJson(Map<String, dynamic> json) {
  return _ZRaportet.fromJson(json);
}

/// @nodoc
mixin _$ZRaportet {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'emri')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'pershkrimi')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'tipi')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'parametrat')
  Map<String, dynamic>? get parameters => throw _privateConstructorUsedError;
  @JsonKey(name: 'te_dhenat')
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_krijimit')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'shfrytezuesi_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError; // Relations
  @JsonKey(name: 'shfrytezuesi')
  Shfrytezuesi? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZRaportetCopyWith<ZRaportet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZRaportetCopyWith<$Res> {
  factory $ZRaportetCopyWith(ZRaportet value, $Res Function(ZRaportet) then) =
      _$ZRaportetCopyWithImpl<$Res, ZRaportet>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'emri') String? name,
      @JsonKey(name: 'pershkrimi') String? description,
      @JsonKey(name: 'tipi') String? type,
      @JsonKey(name: 'parametrat') Map<String, dynamic>? parameters,
      @JsonKey(name: 'te_dhenat') Map<String, dynamic>? data,
      @JsonKey(name: 'data_krijimit') DateTime? createdDate,
      @JsonKey(name: 'shfrytezuesi_id') int? userId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'shfrytezuesi') Shfrytezuesi? user});

  $ShfrytezuesiCopyWith<$Res>? get user;
}

/// @nodoc
class _$ZRaportetCopyWithImpl<$Res, $Val extends ZRaportet>
    implements $ZRaportetCopyWith<$Res> {
  _$ZRaportetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? parameters = freezed,
    Object? data = freezed,
    Object? createdDate = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? user = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Shfrytezuesi?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShfrytezuesiCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $ShfrytezuesiCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ZRaportetImplCopyWith<$Res>
    implements $ZRaportetCopyWith<$Res> {
  factory _$$ZRaportetImplCopyWith(
          _$ZRaportetImpl value, $Res Function(_$ZRaportetImpl) then) =
      __$$ZRaportetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'emri') String? name,
      @JsonKey(name: 'pershkrimi') String? description,
      @JsonKey(name: 'tipi') String? type,
      @JsonKey(name: 'parametrat') Map<String, dynamic>? parameters,
      @JsonKey(name: 'te_dhenat') Map<String, dynamic>? data,
      @JsonKey(name: 'data_krijimit') DateTime? createdDate,
      @JsonKey(name: 'shfrytezuesi_id') int? userId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'shfrytezuesi') Shfrytezuesi? user});

  @override
  $ShfrytezuesiCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ZRaportetImplCopyWithImpl<$Res>
    extends _$ZRaportetCopyWithImpl<$Res, _$ZRaportetImpl>
    implements _$$ZRaportetImplCopyWith<$Res> {
  __$$ZRaportetImplCopyWithImpl(
      _$ZRaportetImpl _value, $Res Function(_$ZRaportetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? parameters = freezed,
    Object? data = freezed,
    Object? createdDate = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_$ZRaportetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      parameters: freezed == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Shfrytezuesi?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ZRaportetImpl implements _ZRaportet {
  const _$ZRaportetImpl(
      {required this.id,
      @JsonKey(name: 'emri') this.name,
      @JsonKey(name: 'pershkrimi') this.description,
      @JsonKey(name: 'tipi') this.type,
      @JsonKey(name: 'parametrat') final Map<String, dynamic>? parameters,
      @JsonKey(name: 'te_dhenat') final Map<String, dynamic>? data,
      @JsonKey(name: 'data_krijimit') this.createdDate,
      @JsonKey(name: 'shfrytezuesi_id') this.userId,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'shfrytezuesi') this.user})
      : _parameters = parameters,
        _data = data;

  factory _$ZRaportetImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZRaportetImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'emri')
  final String? name;
  @override
  @JsonKey(name: 'pershkrimi')
  final String? description;
  @override
  @JsonKey(name: 'tipi')
  final String? type;
  final Map<String, dynamic>? _parameters;
  @override
  @JsonKey(name: 'parametrat')
  Map<String, dynamic>? get parameters {
    final value = _parameters;
    if (value == null) return null;
    if (_parameters is EqualUnmodifiableMapView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _data;
  @override
  @JsonKey(name: 'te_dhenat')
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'data_krijimit')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'shfrytezuesi_id')
  final int? userId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
// Relations
  @override
  @JsonKey(name: 'shfrytezuesi')
  final Shfrytezuesi? user;

  @override
  String toString() {
    return 'ZRaportet(id: $id, name: $name, description: $description, type: $type, parameters: $parameters, data: $data, createdDate: $createdDate, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZRaportetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      type,
      const DeepCollectionEquality().hash(_parameters),
      const DeepCollectionEquality().hash(_data),
      createdDate,
      userId,
      createdAt,
      updatedAt,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZRaportetImplCopyWith<_$ZRaportetImpl> get copyWith =>
      __$$ZRaportetImplCopyWithImpl<_$ZRaportetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZRaportetImplToJson(
      this,
    );
  }
}

abstract class _ZRaportet implements ZRaportet {
  const factory _ZRaportet(
          {required final int id,
          @JsonKey(name: 'emri') final String? name,
          @JsonKey(name: 'pershkrimi') final String? description,
          @JsonKey(name: 'tipi') final String? type,
          @JsonKey(name: 'parametrat') final Map<String, dynamic>? parameters,
          @JsonKey(name: 'te_dhenat') final Map<String, dynamic>? data,
          @JsonKey(name: 'data_krijimit') final DateTime? createdDate,
          @JsonKey(name: 'shfrytezuesi_id') final int? userId,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt,
          @JsonKey(name: 'shfrytezuesi') final Shfrytezuesi? user}) =
      _$ZRaportetImpl;

  factory _ZRaportet.fromJson(Map<String, dynamic> json) =
      _$ZRaportetImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'emri')
  String? get name;
  @override
  @JsonKey(name: 'pershkrimi')
  String? get description;
  @override
  @JsonKey(name: 'tipi')
  String? get type;
  @override
  @JsonKey(name: 'parametrat')
  Map<String, dynamic>? get parameters;
  @override
  @JsonKey(name: 'te_dhenat')
  Map<String, dynamic>? get data;
  @override
  @JsonKey(name: 'data_krijimit')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'shfrytezuesi_id')
  int? get userId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override // Relations
  @JsonKey(name: 'shfrytezuesi')
  Shfrytezuesi? get user;
  @override
  @JsonKey(ignore: true)
  _$$ZRaportetImplCopyWith<_$ZRaportetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
