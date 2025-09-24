// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blerjet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Blerjet _$BlerjetFromJson(Map<String, dynamic> json) {
  return _Blerjet.fromJson(json);
}

/// @nodoc
mixin _$Blerjet {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEFatures')
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'NrFatures')
  String? get purchaseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'AfatiPageses')
  DateTime? get paymentDue => throw _privateConstructorUsedError;
  @JsonKey(name: 'BlerjeKategoriaId')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'NumriFaturesSeFurnitorit')
  String? get supplierInvoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fatura')
  String? get invoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'Staff', fromJson: _boolFromInt)
  bool get staff => throw _privateConstructorUsedError;
  @JsonKey(name: 'SubjektiId')
  int? get supplierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PagesaId')
  int? get paymentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusFatureId')
  int? get statusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OptimisticLockField')
  int? get optimisticLockField => throw _privateConstructorUsedError;
  @JsonKey(name: 'fTotalPorosias')
  double? get totalOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'fTotalVAT')
  double? get totalVat => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPorosias')
  double? get totalOrdersFinal => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalVAT')
  double? get totalVatFinal => throw _privateConstructorUsedError;
  @JsonKey(name: 'ArkaId')
  int? get cashRegisterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenyraPagesesId')
  int? get paymentMethodId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  bool get deleted => throw _privateConstructorUsedError; // Relations
  @JsonKey(name: 'furnitori')
  Subjekti? get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'shfrytezuesi')
  Shfrytezuesi? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'blerje_kategoria')
  BlerjeKategoria? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'porosite_blerjes')
  List<PorositeEBlerjes>? get purchaseOrders =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlerjetCopyWith<Blerjet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlerjetCopyWith<$Res> {
  factory $BlerjetCopyWith(Blerjet value, $Res Function(Blerjet) then) =
      _$BlerjetCopyWithImpl<$Res, Blerjet>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'DataEFatures') DateTime? date,
      @JsonKey(name: 'NrFatures') String? purchaseNumber,
      @JsonKey(name: 'AfatiPageses') DateTime? paymentDue,
      @JsonKey(name: 'BlerjeKategoriaId') int? categoryId,
      @JsonKey(name: 'NumriFaturesSeFurnitorit') String? supplierInvoiceNumber,
      @JsonKey(name: 'Fatura') String? invoice,
      @JsonKey(name: 'Staff', fromJson: _boolFromInt) bool staff,
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
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted,
      @JsonKey(name: 'furnitori') Subjekti? supplier,
      @JsonKey(name: 'shfrytezuesi') Shfrytezuesi? user,
      @JsonKey(name: 'blerje_kategoria') BlerjeKategoria? category,
      @JsonKey(name: 'porosite_blerjes')
      List<PorositeEBlerjes>? purchaseOrders});

  $SubjektiCopyWith<$Res>? get supplier;
  $ShfrytezuesiCopyWith<$Res>? get user;
  $BlerjeKategoriaCopyWith<$Res>? get category;
}

/// @nodoc
class _$BlerjetCopyWithImpl<$Res, $Val extends Blerjet>
    implements $BlerjetCopyWith<$Res> {
  _$BlerjetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = freezed,
    Object? purchaseNumber = freezed,
    Object? paymentDue = freezed,
    Object? categoryId = freezed,
    Object? supplierInvoiceNumber = freezed,
    Object? invoice = freezed,
    Object? staff = null,
    Object? supplierId = freezed,
    Object? paymentId = freezed,
    Object? statusId = freezed,
    Object? optimisticLockField = freezed,
    Object? totalOrders = freezed,
    Object? totalVat = freezed,
    Object? totalOrdersFinal = freezed,
    Object? totalVatFinal = freezed,
    Object? cashRegisterId = freezed,
    Object? paymentMethodId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
    Object? supplier = freezed,
    Object? user = freezed,
    Object? category = freezed,
    Object? purchaseOrders = freezed,
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
      purchaseNumber: freezed == purchaseNumber
          ? _value.purchaseNumber
          : purchaseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDue: freezed == paymentDue
          ? _value.paymentDue
          : paymentDue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierInvoiceNumber: freezed == supplierInvoiceNumber
          ? _value.supplierInvoiceNumber
          : supplierInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String?,
      staff: null == staff
          ? _value.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as bool,
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as int?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      optimisticLockField: freezed == optimisticLockField
          ? _value.optimisticLockField
          : optimisticLockField // ignore: cast_nullable_to_non_nullable
              as int?,
      totalOrders: freezed == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as double?,
      totalVat: freezed == totalVat
          ? _value.totalVat
          : totalVat // ignore: cast_nullable_to_non_nullable
              as double?,
      totalOrdersFinal: freezed == totalOrdersFinal
          ? _value.totalOrdersFinal
          : totalOrdersFinal // ignore: cast_nullable_to_non_nullable
              as double?,
      totalVatFinal: freezed == totalVatFinal
          ? _value.totalVatFinal
          : totalVatFinal // ignore: cast_nullable_to_non_nullable
              as double?,
      cashRegisterId: freezed == cashRegisterId
          ? _value.cashRegisterId
          : cashRegisterId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Subjekti?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Shfrytezuesi?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as BlerjeKategoria?,
      purchaseOrders: freezed == purchaseOrders
          ? _value.purchaseOrders
          : purchaseOrders // ignore: cast_nullable_to_non_nullable
              as List<PorositeEBlerjes>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjektiCopyWith<$Res>? get supplier {
    if (_value.supplier == null) {
      return null;
    }

    return $SubjektiCopyWith<$Res>(_value.supplier!, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
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

  @override
  @pragma('vm:prefer-inline')
  $BlerjeKategoriaCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $BlerjeKategoriaCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BlerjetImplCopyWith<$Res> implements $BlerjetCopyWith<$Res> {
  factory _$$BlerjetImplCopyWith(
          _$BlerjetImpl value, $Res Function(_$BlerjetImpl) then) =
      __$$BlerjetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'DataEFatures') DateTime? date,
      @JsonKey(name: 'NrFatures') String? purchaseNumber,
      @JsonKey(name: 'AfatiPageses') DateTime? paymentDue,
      @JsonKey(name: 'BlerjeKategoriaId') int? categoryId,
      @JsonKey(name: 'NumriFaturesSeFurnitorit') String? supplierInvoiceNumber,
      @JsonKey(name: 'Fatura') String? invoice,
      @JsonKey(name: 'Staff', fromJson: _boolFromInt) bool staff,
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
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted,
      @JsonKey(name: 'furnitori') Subjekti? supplier,
      @JsonKey(name: 'shfrytezuesi') Shfrytezuesi? user,
      @JsonKey(name: 'blerje_kategoria') BlerjeKategoria? category,
      @JsonKey(name: 'porosite_blerjes')
      List<PorositeEBlerjes>? purchaseOrders});

  @override
  $SubjektiCopyWith<$Res>? get supplier;
  @override
  $ShfrytezuesiCopyWith<$Res>? get user;
  @override
  $BlerjeKategoriaCopyWith<$Res>? get category;
}

/// @nodoc
class __$$BlerjetImplCopyWithImpl<$Res>
    extends _$BlerjetCopyWithImpl<$Res, _$BlerjetImpl>
    implements _$$BlerjetImplCopyWith<$Res> {
  __$$BlerjetImplCopyWithImpl(
      _$BlerjetImpl _value, $Res Function(_$BlerjetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = freezed,
    Object? purchaseNumber = freezed,
    Object? paymentDue = freezed,
    Object? categoryId = freezed,
    Object? supplierInvoiceNumber = freezed,
    Object? invoice = freezed,
    Object? staff = null,
    Object? supplierId = freezed,
    Object? paymentId = freezed,
    Object? statusId = freezed,
    Object? optimisticLockField = freezed,
    Object? totalOrders = freezed,
    Object? totalVat = freezed,
    Object? totalOrdersFinal = freezed,
    Object? totalVatFinal = freezed,
    Object? cashRegisterId = freezed,
    Object? paymentMethodId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
    Object? supplier = freezed,
    Object? user = freezed,
    Object? category = freezed,
    Object? purchaseOrders = freezed,
  }) {
    return _then(_$BlerjetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchaseNumber: freezed == purchaseNumber
          ? _value.purchaseNumber
          : purchaseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDue: freezed == paymentDue
          ? _value.paymentDue
          : paymentDue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierInvoiceNumber: freezed == supplierInvoiceNumber
          ? _value.supplierInvoiceNumber
          : supplierInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String?,
      staff: null == staff
          ? _value.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as bool,
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as int?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      optimisticLockField: freezed == optimisticLockField
          ? _value.optimisticLockField
          : optimisticLockField // ignore: cast_nullable_to_non_nullable
              as int?,
      totalOrders: freezed == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as double?,
      totalVat: freezed == totalVat
          ? _value.totalVat
          : totalVat // ignore: cast_nullable_to_non_nullable
              as double?,
      totalOrdersFinal: freezed == totalOrdersFinal
          ? _value.totalOrdersFinal
          : totalOrdersFinal // ignore: cast_nullable_to_non_nullable
              as double?,
      totalVatFinal: freezed == totalVatFinal
          ? _value.totalVatFinal
          : totalVatFinal // ignore: cast_nullable_to_non_nullable
              as double?,
      cashRegisterId: freezed == cashRegisterId
          ? _value.cashRegisterId
          : cashRegisterId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Subjekti?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Shfrytezuesi?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as BlerjeKategoria?,
      purchaseOrders: freezed == purchaseOrders
          ? _value._purchaseOrders
          : purchaseOrders // ignore: cast_nullable_to_non_nullable
              as List<PorositeEBlerjes>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlerjetImpl implements _Blerjet {
  const _$BlerjetImpl(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'DataEFatures') this.date,
      @JsonKey(name: 'NrFatures') this.purchaseNumber,
      @JsonKey(name: 'AfatiPageses') this.paymentDue,
      @JsonKey(name: 'BlerjeKategoriaId') this.categoryId,
      @JsonKey(name: 'NumriFaturesSeFurnitorit') this.supplierInvoiceNumber,
      @JsonKey(name: 'Fatura') this.invoice,
      @JsonKey(name: 'Staff', fromJson: _boolFromInt) this.staff = false,
      @JsonKey(name: 'SubjektiId') this.supplierId,
      @JsonKey(name: 'PagesaId') this.paymentId,
      @JsonKey(name: 'StatusFatureId') this.statusId,
      @JsonKey(name: 'OptimisticLockField') this.optimisticLockField,
      @JsonKey(name: 'fTotalPorosias') this.totalOrders,
      @JsonKey(name: 'fTotalVAT') this.totalVat,
      @JsonKey(name: 'TotalPorosias') this.totalOrdersFinal,
      @JsonKey(name: 'TotalVAT') this.totalVatFinal,
      @JsonKey(name: 'ArkaId') this.cashRegisterId,
      @JsonKey(name: 'MenyraPagesesId') this.paymentMethodId,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) this.deleted = false,
      @JsonKey(name: 'furnitori') this.supplier,
      @JsonKey(name: 'shfrytezuesi') this.user,
      @JsonKey(name: 'blerje_kategoria') this.category,
      @JsonKey(name: 'porosite_blerjes')
      final List<PorositeEBlerjes>? purchaseOrders})
      : _purchaseOrders = purchaseOrders;

  factory _$BlerjetImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlerjetImplFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'DataEFatures')
  final DateTime? date;
  @override
  @JsonKey(name: 'NrFatures')
  final String? purchaseNumber;
  @override
  @JsonKey(name: 'AfatiPageses')
  final DateTime? paymentDue;
  @override
  @JsonKey(name: 'BlerjeKategoriaId')
  final int? categoryId;
  @override
  @JsonKey(name: 'NumriFaturesSeFurnitorit')
  final String? supplierInvoiceNumber;
  @override
  @JsonKey(name: 'Fatura')
  final String? invoice;
  @override
  @JsonKey(name: 'Staff', fromJson: _boolFromInt)
  final bool staff;
  @override
  @JsonKey(name: 'SubjektiId')
  final int? supplierId;
  @override
  @JsonKey(name: 'PagesaId')
  final int? paymentId;
  @override
  @JsonKey(name: 'StatusFatureId')
  final int? statusId;
  @override
  @JsonKey(name: 'OptimisticLockField')
  final int? optimisticLockField;
  @override
  @JsonKey(name: 'fTotalPorosias')
  final double? totalOrders;
  @override
  @JsonKey(name: 'fTotalVAT')
  final double? totalVat;
  @override
  @JsonKey(name: 'TotalPorosias')
  final double? totalOrdersFinal;
  @override
  @JsonKey(name: 'TotalVAT')
  final double? totalVatFinal;
  @override
  @JsonKey(name: 'ArkaId')
  final int? cashRegisterId;
  @override
  @JsonKey(name: 'MenyraPagesesId')
  final int? paymentMethodId;
  @override
  @JsonKey(name: 'DataEKrijimit')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  final bool deleted;
// Relations
  @override
  @JsonKey(name: 'furnitori')
  final Subjekti? supplier;
  @override
  @JsonKey(name: 'shfrytezuesi')
  final Shfrytezuesi? user;
  @override
  @JsonKey(name: 'blerje_kategoria')
  final BlerjeKategoria? category;
  final List<PorositeEBlerjes>? _purchaseOrders;
  @override
  @JsonKey(name: 'porosite_blerjes')
  List<PorositeEBlerjes>? get purchaseOrders {
    final value = _purchaseOrders;
    if (value == null) return null;
    if (_purchaseOrders is EqualUnmodifiableListView) return _purchaseOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Blerjet(id: $id, date: $date, purchaseNumber: $purchaseNumber, paymentDue: $paymentDue, categoryId: $categoryId, supplierInvoiceNumber: $supplierInvoiceNumber, invoice: $invoice, staff: $staff, supplierId: $supplierId, paymentId: $paymentId, statusId: $statusId, optimisticLockField: $optimisticLockField, totalOrders: $totalOrders, totalVat: $totalVat, totalOrdersFinal: $totalOrdersFinal, totalVatFinal: $totalVatFinal, cashRegisterId: $cashRegisterId, paymentMethodId: $paymentMethodId, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted, supplier: $supplier, user: $user, category: $category, purchaseOrders: $purchaseOrders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlerjetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.purchaseNumber, purchaseNumber) ||
                other.purchaseNumber == purchaseNumber) &&
            (identical(other.paymentDue, paymentDue) ||
                other.paymentDue == paymentDue) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.supplierInvoiceNumber, supplierInvoiceNumber) ||
                other.supplierInvoiceNumber == supplierInvoiceNumber) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            (identical(other.staff, staff) || other.staff == staff) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.optimisticLockField, optimisticLockField) ||
                other.optimisticLockField == optimisticLockField) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalVat, totalVat) ||
                other.totalVat == totalVat) &&
            (identical(other.totalOrdersFinal, totalOrdersFinal) ||
                other.totalOrdersFinal == totalOrdersFinal) &&
            (identical(other.totalVatFinal, totalVatFinal) ||
                other.totalVatFinal == totalVatFinal) &&
            (identical(other.cashRegisterId, cashRegisterId) ||
                other.cashRegisterId == cashRegisterId) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._purchaseOrders, _purchaseOrders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        date,
        purchaseNumber,
        paymentDue,
        categoryId,
        supplierInvoiceNumber,
        invoice,
        staff,
        supplierId,
        paymentId,
        statusId,
        optimisticLockField,
        totalOrders,
        totalVat,
        totalOrdersFinal,
        totalVatFinal,
        cashRegisterId,
        paymentMethodId,
        createdAt,
        updatedAt,
        deleted,
        supplier,
        user,
        category,
        const DeepCollectionEquality().hash(_purchaseOrders)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlerjetImplCopyWith<_$BlerjetImpl> get copyWith =>
      __$$BlerjetImplCopyWithImpl<_$BlerjetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlerjetImplToJson(
      this,
    );
  }
}

abstract class _Blerjet implements Blerjet {
  const factory _Blerjet(
      {@JsonKey(name: 'Id') required final int id,
      @JsonKey(name: 'DataEFatures') final DateTime? date,
      @JsonKey(name: 'NrFatures') final String? purchaseNumber,
      @JsonKey(name: 'AfatiPageses') final DateTime? paymentDue,
      @JsonKey(name: 'BlerjeKategoriaId') final int? categoryId,
      @JsonKey(name: 'NumriFaturesSeFurnitorit')
      final String? supplierInvoiceNumber,
      @JsonKey(name: 'Fatura') final String? invoice,
      @JsonKey(name: 'Staff', fromJson: _boolFromInt) final bool staff,
      @JsonKey(name: 'SubjektiId') final int? supplierId,
      @JsonKey(name: 'PagesaId') final int? paymentId,
      @JsonKey(name: 'StatusFatureId') final int? statusId,
      @JsonKey(name: 'OptimisticLockField') final int? optimisticLockField,
      @JsonKey(name: 'fTotalPorosias') final double? totalOrders,
      @JsonKey(name: 'fTotalVAT') final double? totalVat,
      @JsonKey(name: 'TotalPorosias') final double? totalOrdersFinal,
      @JsonKey(name: 'TotalVAT') final double? totalVatFinal,
      @JsonKey(name: 'ArkaId') final int? cashRegisterId,
      @JsonKey(name: 'MenyraPagesesId') final int? paymentMethodId,
      @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) final bool deleted,
      @JsonKey(name: 'furnitori') final Subjekti? supplier,
      @JsonKey(name: 'shfrytezuesi') final Shfrytezuesi? user,
      @JsonKey(name: 'blerje_kategoria') final BlerjeKategoria? category,
      @JsonKey(name: 'porosite_blerjes')
      final List<PorositeEBlerjes>? purchaseOrders}) = _$BlerjetImpl;

  factory _Blerjet.fromJson(Map<String, dynamic> json) = _$BlerjetImpl.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'DataEFatures')
  DateTime? get date;
  @override
  @JsonKey(name: 'NrFatures')
  String? get purchaseNumber;
  @override
  @JsonKey(name: 'AfatiPageses')
  DateTime? get paymentDue;
  @override
  @JsonKey(name: 'BlerjeKategoriaId')
  int? get categoryId;
  @override
  @JsonKey(name: 'NumriFaturesSeFurnitorit')
  String? get supplierInvoiceNumber;
  @override
  @JsonKey(name: 'Fatura')
  String? get invoice;
  @override
  @JsonKey(name: 'Staff', fromJson: _boolFromInt)
  bool get staff;
  @override
  @JsonKey(name: 'SubjektiId')
  int? get supplierId;
  @override
  @JsonKey(name: 'PagesaId')
  int? get paymentId;
  @override
  @JsonKey(name: 'StatusFatureId')
  int? get statusId;
  @override
  @JsonKey(name: 'OptimisticLockField')
  int? get optimisticLockField;
  @override
  @JsonKey(name: 'fTotalPorosias')
  double? get totalOrders;
  @override
  @JsonKey(name: 'fTotalVAT')
  double? get totalVat;
  @override
  @JsonKey(name: 'TotalPorosias')
  double? get totalOrdersFinal;
  @override
  @JsonKey(name: 'TotalVAT')
  double? get totalVatFinal;
  @override
  @JsonKey(name: 'ArkaId')
  int? get cashRegisterId;
  @override
  @JsonKey(name: 'MenyraPagesesId')
  int? get paymentMethodId;
  @override
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  bool get deleted;
  @override // Relations
  @JsonKey(name: 'furnitori')
  Subjekti? get supplier;
  @override
  @JsonKey(name: 'shfrytezuesi')
  Shfrytezuesi? get user;
  @override
  @JsonKey(name: 'blerje_kategoria')
  BlerjeKategoria? get category;
  @override
  @JsonKey(name: 'porosite_blerjes')
  List<PorositeEBlerjes>? get purchaseOrders;
  @override
  @JsonKey(ignore: true)
  _$$BlerjetImplCopyWith<_$BlerjetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BlerjeKategoria _$BlerjeKategoriaFromJson(Map<String, dynamic> json) {
  return _BlerjeKategoria.fromJson(json);
}

/// @nodoc
mixin _$BlerjeKategoria {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Emri')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Kodi')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Pershkrimi')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'TvshId')
  int? get tvshId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  bool get deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlerjeKategoriaCopyWith<BlerjeKategoria> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlerjeKategoriaCopyWith<$Res> {
  factory $BlerjeKategoriaCopyWith(
          BlerjeKategoria value, $Res Function(BlerjeKategoria) then) =
      _$BlerjeKategoriaCopyWithImpl<$Res, BlerjeKategoria>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'Emri') String? name,
      @JsonKey(name: 'Kodi') String? code,
      @JsonKey(name: 'Pershkrimi') String? description,
      @JsonKey(name: 'TvshId') int? tvshId,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted});
}

/// @nodoc
class _$BlerjeKategoriaCopyWithImpl<$Res, $Val extends BlerjeKategoria>
    implements $BlerjeKategoriaCopyWith<$Res> {
  _$BlerjeKategoriaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? tvshId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
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
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tvshId: freezed == tvshId
          ? _value.tvshId
          : tvshId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlerjeKategoriaImplCopyWith<$Res>
    implements $BlerjeKategoriaCopyWith<$Res> {
  factory _$$BlerjeKategoriaImplCopyWith(_$BlerjeKategoriaImpl value,
          $Res Function(_$BlerjeKategoriaImpl) then) =
      __$$BlerjeKategoriaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'Emri') String? name,
      @JsonKey(name: 'Kodi') String? code,
      @JsonKey(name: 'Pershkrimi') String? description,
      @JsonKey(name: 'TvshId') int? tvshId,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted});
}

/// @nodoc
class __$$BlerjeKategoriaImplCopyWithImpl<$Res>
    extends _$BlerjeKategoriaCopyWithImpl<$Res, _$BlerjeKategoriaImpl>
    implements _$$BlerjeKategoriaImplCopyWith<$Res> {
  __$$BlerjeKategoriaImplCopyWithImpl(
      _$BlerjeKategoriaImpl _value, $Res Function(_$BlerjeKategoriaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? tvshId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
  }) {
    return _then(_$BlerjeKategoriaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tvshId: freezed == tvshId
          ? _value.tvshId
          : tvshId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlerjeKategoriaImpl implements _BlerjeKategoria {
  const _$BlerjeKategoriaImpl(
      {required this.id,
      @JsonKey(name: 'Emri') this.name,
      @JsonKey(name: 'Kodi') this.code,
      @JsonKey(name: 'Pershkrimi') this.description,
      @JsonKey(name: 'TvshId') this.tvshId,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) this.deleted = false});

  factory _$BlerjeKategoriaImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlerjeKategoriaImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'Emri')
  final String? name;
  @override
  @JsonKey(name: 'Kodi')
  final String? code;
  @override
  @JsonKey(name: 'Pershkrimi')
  final String? description;
  @override
  @JsonKey(name: 'TvshId')
  final int? tvshId;
  @override
  @JsonKey(name: 'DataEKrijimit')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  final bool deleted;

  @override
  String toString() {
    return 'BlerjeKategoria(id: $id, name: $name, code: $code, description: $description, tvshId: $tvshId, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlerjeKategoriaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.tvshId, tvshId) || other.tvshId == tvshId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code, description,
      tvshId, createdAt, updatedAt, deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlerjeKategoriaImplCopyWith<_$BlerjeKategoriaImpl> get copyWith =>
      __$$BlerjeKategoriaImplCopyWithImpl<_$BlerjeKategoriaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlerjeKategoriaImplToJson(
      this,
    );
  }
}

abstract class _BlerjeKategoria implements BlerjeKategoria {
  const factory _BlerjeKategoria(
      {required final int id,
      @JsonKey(name: 'Emri') final String? name,
      @JsonKey(name: 'Kodi') final String? code,
      @JsonKey(name: 'Pershkrimi') final String? description,
      @JsonKey(name: 'TvshId') final int? tvshId,
      @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
      final bool deleted}) = _$BlerjeKategoriaImpl;

  factory _BlerjeKategoria.fromJson(Map<String, dynamic> json) =
      _$BlerjeKategoriaImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'Emri')
  String? get name;
  @override
  @JsonKey(name: 'Kodi')
  String? get code;
  @override
  @JsonKey(name: 'Pershkrimi')
  String? get description;
  @override
  @JsonKey(name: 'TvshId')
  int? get tvshId;
  @override
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$BlerjeKategoriaImplCopyWith<_$BlerjeKategoriaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PorositeEBlerjes _$PorositeEBlerjesFromJson(Map<String, dynamic> json) {
  return _PorositeEBlerjes.fromJson(json);
}

/// @nodoc
mixin _$PorositeEBlerjes {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProduktiId')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Sasia')
  double? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'CmimiNjesi')
  double? get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'BlerjaId')
  int? get purchaseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PorosiaDate')
  DateTime? get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Tvsh')
  double? get vat => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rabati')
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total')
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  bool get deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PorositeEBlerjesCopyWith<PorositeEBlerjes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PorositeEBlerjesCopyWith<$Res> {
  factory $PorositeEBlerjesCopyWith(
          PorositeEBlerjes value, $Res Function(PorositeEBlerjes) then) =
      _$PorositeEBlerjesCopyWithImpl<$Res, PorositeEBlerjes>;
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted});
}

/// @nodoc
class _$PorositeEBlerjesCopyWithImpl<$Res, $Val extends PorositeEBlerjes>
    implements $PorositeEBlerjesCopyWith<$Res> {
  _$PorositeEBlerjesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? purchaseId = freezed,
    Object? orderDate = freezed,
    Object? vat = freezed,
    Object? discount = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      purchaseId: freezed == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vat: freezed == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PorositeEBlerjesImplCopyWith<$Res>
    implements $PorositeEBlerjesCopyWith<$Res> {
  factory _$$PorositeEBlerjesImplCopyWith(_$PorositeEBlerjesImpl value,
          $Res Function(_$PorositeEBlerjesImpl) then) =
      __$$PorositeEBlerjesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted});
}

/// @nodoc
class __$$PorositeEBlerjesImplCopyWithImpl<$Res>
    extends _$PorositeEBlerjesCopyWithImpl<$Res, _$PorositeEBlerjesImpl>
    implements _$$PorositeEBlerjesImplCopyWith<$Res> {
  __$$PorositeEBlerjesImplCopyWithImpl(_$PorositeEBlerjesImpl _value,
      $Res Function(_$PorositeEBlerjesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? purchaseId = freezed,
    Object? orderDate = freezed,
    Object? vat = freezed,
    Object? discount = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
  }) {
    return _then(_$PorositeEBlerjesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      purchaseId: freezed == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vat: freezed == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PorositeEBlerjesImpl implements _PorositeEBlerjes {
  const _$PorositeEBlerjesImpl(
      {required this.id,
      @JsonKey(name: 'ProduktiId') this.productId,
      @JsonKey(name: 'Sasia') this.quantity,
      @JsonKey(name: 'CmimiNjesi') this.unitPrice,
      @JsonKey(name: 'BlerjaId') this.purchaseId,
      @JsonKey(name: 'PorosiaDate') this.orderDate,
      @JsonKey(name: 'Tvsh') this.vat,
      @JsonKey(name: 'Rabati') this.discount,
      @JsonKey(name: 'Total') this.total,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) this.deleted = false});

  factory _$PorositeEBlerjesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PorositeEBlerjesImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'ProduktiId')
  final int? productId;
  @override
  @JsonKey(name: 'Sasia')
  final double? quantity;
  @override
  @JsonKey(name: 'CmimiNjesi')
  final double? unitPrice;
  @override
  @JsonKey(name: 'BlerjaId')
  final int? purchaseId;
  @override
  @JsonKey(name: 'PorosiaDate')
  final DateTime? orderDate;
  @override
  @JsonKey(name: 'Tvsh')
  final double? vat;
  @override
  @JsonKey(name: 'Rabati')
  final double? discount;
  @override
  @JsonKey(name: 'Total')
  final double? total;
  @override
  @JsonKey(name: 'DataEKrijimit')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  final bool deleted;

  @override
  String toString() {
    return 'PorositeEBlerjes(id: $id, productId: $productId, quantity: $quantity, unitPrice: $unitPrice, purchaseId: $purchaseId, orderDate: $orderDate, vat: $vat, discount: $discount, total: $total, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PorositeEBlerjesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      productId,
      quantity,
      unitPrice,
      purchaseId,
      orderDate,
      vat,
      discount,
      total,
      createdAt,
      updatedAt,
      deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PorositeEBlerjesImplCopyWith<_$PorositeEBlerjesImpl> get copyWith =>
      __$$PorositeEBlerjesImplCopyWithImpl<_$PorositeEBlerjesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PorositeEBlerjesImplToJson(
      this,
    );
  }
}

abstract class _PorositeEBlerjes implements PorositeEBlerjes {
  const factory _PorositeEBlerjes(
      {required final int id,
      @JsonKey(name: 'ProduktiId') final int? productId,
      @JsonKey(name: 'Sasia') final double? quantity,
      @JsonKey(name: 'CmimiNjesi') final double? unitPrice,
      @JsonKey(name: 'BlerjaId') final int? purchaseId,
      @JsonKey(name: 'PorosiaDate') final DateTime? orderDate,
      @JsonKey(name: 'Tvsh') final double? vat,
      @JsonKey(name: 'Rabati') final double? discount,
      @JsonKey(name: 'Total') final double? total,
      @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
      final bool deleted}) = _$PorositeEBlerjesImpl;

  factory _PorositeEBlerjes.fromJson(Map<String, dynamic> json) =
      _$PorositeEBlerjesImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'ProduktiId')
  int? get productId;
  @override
  @JsonKey(name: 'Sasia')
  double? get quantity;
  @override
  @JsonKey(name: 'CmimiNjesi')
  double? get unitPrice;
  @override
  @JsonKey(name: 'BlerjaId')
  int? get purchaseId;
  @override
  @JsonKey(name: 'PorosiaDate')
  DateTime? get orderDate;
  @override
  @JsonKey(name: 'Tvsh')
  double? get vat;
  @override
  @JsonKey(name: 'Rabati')
  double? get discount;
  @override
  @JsonKey(name: 'Total')
  double? get total;
  @override
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$PorositeEBlerjesImplCopyWith<_$PorositeEBlerjesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
