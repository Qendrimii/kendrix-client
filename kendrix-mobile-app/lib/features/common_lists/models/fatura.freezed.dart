// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fatura.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Fatura _$FaturaFromJson(Map<String, dynamic> json) {
  return _Fatura.fromJson(json);
}

/// @nodoc
mixin _$Fatura {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'NrFatures')
  String? get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Data')
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'SubjektiId')
  int? get subjectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShfrytezuesiId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FaturaKategoriaId')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotaliPaTvsh')
  double? get totalWithoutVat => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotaliTvsh')
  double? get totalVat => throw _privateConstructorUsedError;
  @JsonKey(name: 'Totali')
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'Zbritja')
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Statusi')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  bool get deleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'Staff', fromJson: _boolFromInt)
  bool get staff => throw _privateConstructorUsedError;
  @JsonKey(name: 'AfatiPageses')
  DateTime? get paymentDue => throw _privateConstructorUsedError;
  @JsonKey(name: 'Comment')
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenant_id')
  int? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusFatureId')
  int? get statusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PagesaId')
  int? get paymentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'KodiValues')
  String? get currencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'KursiKembimit', fromJson: _doubleFromString)
  double? get exchangeRate => throw _privateConstructorUsedError; // Relations
  @JsonKey(name: 'subjekti')
  Subjekti? get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'shfrytezuesi')
  Shfrytezuesi? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'fatura_kategoria')
  FaturaKategoria? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'porosi')
  List<Porosia>? get orders => throw _privateConstructorUsedError;
  @JsonKey(name: 'pagesat')
  List<Pagesat>? get payments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FaturaCopyWith<Fatura> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaturaCopyWith<$Res> {
  factory $FaturaCopyWith(Fatura value, $Res Function(Fatura) then) =
      _$FaturaCopyWithImpl<$Res, Fatura>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
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
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted,
      @JsonKey(name: 'Staff', fromJson: _boolFromInt) bool staff,
      @JsonKey(name: 'AfatiPageses') DateTime? paymentDue,
      @JsonKey(name: 'Comment') String? comment,
      @JsonKey(name: 'tenant_id') int? tenantId,
      @JsonKey(name: 'StatusFatureId') int? statusId,
      @JsonKey(name: 'PagesaId') int? paymentId,
      @JsonKey(name: 'KodiValues') String? currencyCode,
      @JsonKey(name: 'KursiKembimit', fromJson: _doubleFromString)
      double? exchangeRate,
      @JsonKey(name: 'subjekti') Subjekti? subject,
      @JsonKey(name: 'shfrytezuesi') Shfrytezuesi? user,
      @JsonKey(name: 'fatura_kategoria') FaturaKategoria? category,
      @JsonKey(name: 'porosi') List<Porosia>? orders,
      @JsonKey(name: 'pagesat') List<Pagesat>? payments});

  $SubjektiCopyWith<$Res>? get subject;
  $ShfrytezuesiCopyWith<$Res>? get user;
  $FaturaKategoriaCopyWith<$Res>? get category;
}

/// @nodoc
class _$FaturaCopyWithImpl<$Res, $Val extends Fatura>
    implements $FaturaCopyWith<$Res> {
  _$FaturaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceNumber = freezed,
    Object? date = freezed,
    Object? subjectId = freezed,
    Object? userId = freezed,
    Object? categoryId = freezed,
    Object? totalWithoutVat = freezed,
    Object? totalVat = freezed,
    Object? total = freezed,
    Object? discount = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
    Object? staff = null,
    Object? paymentDue = freezed,
    Object? comment = freezed,
    Object? tenantId = freezed,
    Object? statusId = freezed,
    Object? paymentId = freezed,
    Object? currencyCode = freezed,
    Object? exchangeRate = freezed,
    Object? subject = freezed,
    Object? user = freezed,
    Object? category = freezed,
    Object? orders = freezed,
    Object? payments = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: freezed == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subjectId: freezed == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalWithoutVat: freezed == totalWithoutVat
          ? _value.totalWithoutVat
          : totalWithoutVat // ignore: cast_nullable_to_non_nullable
              as double?,
      totalVat: freezed == totalVat
          ? _value.totalVat
          : totalVat // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
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
      staff: null == staff
          ? _value.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentDue: freezed == paymentDue
          ? _value.paymentDue
          : paymentDue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as int?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as int?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeRate: freezed == exchangeRate
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as double?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subjekti?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Shfrytezuesi?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FaturaKategoria?,
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Porosia>?,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<Pagesat>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjektiCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $SubjektiCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
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
  $FaturaKategoriaCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $FaturaKategoriaCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FaturaImplCopyWith<$Res> implements $FaturaCopyWith<$Res> {
  factory _$$FaturaImplCopyWith(
          _$FaturaImpl value, $Res Function(_$FaturaImpl) then) =
      __$$FaturaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
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
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted,
      @JsonKey(name: 'Staff', fromJson: _boolFromInt) bool staff,
      @JsonKey(name: 'AfatiPageses') DateTime? paymentDue,
      @JsonKey(name: 'Comment') String? comment,
      @JsonKey(name: 'tenant_id') int? tenantId,
      @JsonKey(name: 'StatusFatureId') int? statusId,
      @JsonKey(name: 'PagesaId') int? paymentId,
      @JsonKey(name: 'KodiValues') String? currencyCode,
      @JsonKey(name: 'KursiKembimit', fromJson: _doubleFromString)
      double? exchangeRate,
      @JsonKey(name: 'subjekti') Subjekti? subject,
      @JsonKey(name: 'shfrytezuesi') Shfrytezuesi? user,
      @JsonKey(name: 'fatura_kategoria') FaturaKategoria? category,
      @JsonKey(name: 'porosi') List<Porosia>? orders,
      @JsonKey(name: 'pagesat') List<Pagesat>? payments});

  @override
  $SubjektiCopyWith<$Res>? get subject;
  @override
  $ShfrytezuesiCopyWith<$Res>? get user;
  @override
  $FaturaKategoriaCopyWith<$Res>? get category;
}

/// @nodoc
class __$$FaturaImplCopyWithImpl<$Res>
    extends _$FaturaCopyWithImpl<$Res, _$FaturaImpl>
    implements _$$FaturaImplCopyWith<$Res> {
  __$$FaturaImplCopyWithImpl(
      _$FaturaImpl _value, $Res Function(_$FaturaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceNumber = freezed,
    Object? date = freezed,
    Object? subjectId = freezed,
    Object? userId = freezed,
    Object? categoryId = freezed,
    Object? totalWithoutVat = freezed,
    Object? totalVat = freezed,
    Object? total = freezed,
    Object? discount = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
    Object? staff = null,
    Object? paymentDue = freezed,
    Object? comment = freezed,
    Object? tenantId = freezed,
    Object? statusId = freezed,
    Object? paymentId = freezed,
    Object? currencyCode = freezed,
    Object? exchangeRate = freezed,
    Object? subject = freezed,
    Object? user = freezed,
    Object? category = freezed,
    Object? orders = freezed,
    Object? payments = freezed,
  }) {
    return _then(_$FaturaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: freezed == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subjectId: freezed == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalWithoutVat: freezed == totalWithoutVat
          ? _value.totalWithoutVat
          : totalWithoutVat // ignore: cast_nullable_to_non_nullable
              as double?,
      totalVat: freezed == totalVat
          ? _value.totalVat
          : totalVat // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
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
      staff: null == staff
          ? _value.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentDue: freezed == paymentDue
          ? _value.paymentDue
          : paymentDue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as int?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as int?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeRate: freezed == exchangeRate
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as double?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subjekti?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Shfrytezuesi?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FaturaKategoria?,
      orders: freezed == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Porosia>?,
      payments: freezed == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<Pagesat>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaturaImpl implements _Fatura {
  const _$FaturaImpl(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'NrFatures') this.invoiceNumber,
      @JsonKey(name: 'Data') this.date,
      @JsonKey(name: 'SubjektiId') this.subjectId,
      @JsonKey(name: 'ShfrytezuesiId') this.userId,
      @JsonKey(name: 'FaturaKategoriaId') this.categoryId,
      @JsonKey(name: 'TotaliPaTvsh') this.totalWithoutVat,
      @JsonKey(name: 'TotaliTvsh') this.totalVat,
      @JsonKey(name: 'Totali') this.total,
      @JsonKey(name: 'Zbritja') this.discount,
      @JsonKey(name: 'Statusi') this.status,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) this.deleted = false,
      @JsonKey(name: 'Staff', fromJson: _boolFromInt) this.staff = false,
      @JsonKey(name: 'AfatiPageses') this.paymentDue,
      @JsonKey(name: 'Comment') this.comment,
      @JsonKey(name: 'tenant_id') this.tenantId,
      @JsonKey(name: 'StatusFatureId') this.statusId,
      @JsonKey(name: 'PagesaId') this.paymentId,
      @JsonKey(name: 'KodiValues') this.currencyCode,
      @JsonKey(name: 'KursiKembimit', fromJson: _doubleFromString)
      this.exchangeRate,
      @JsonKey(name: 'subjekti') this.subject,
      @JsonKey(name: 'shfrytezuesi') this.user,
      @JsonKey(name: 'fatura_kategoria') this.category,
      @JsonKey(name: 'porosi') final List<Porosia>? orders,
      @JsonKey(name: 'pagesat') final List<Pagesat>? payments})
      : _orders = orders,
        _payments = payments;

  factory _$FaturaImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaturaImplFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'NrFatures')
  final String? invoiceNumber;
  @override
  @JsonKey(name: 'Data')
  final DateTime? date;
  @override
  @JsonKey(name: 'SubjektiId')
  final int? subjectId;
  @override
  @JsonKey(name: 'ShfrytezuesiId')
  final int? userId;
  @override
  @JsonKey(name: 'FaturaKategoriaId')
  final int? categoryId;
  @override
  @JsonKey(name: 'TotaliPaTvsh')
  final double? totalWithoutVat;
  @override
  @JsonKey(name: 'TotaliTvsh')
  final double? totalVat;
  @override
  @JsonKey(name: 'Totali')
  final double? total;
  @override
  @JsonKey(name: 'Zbritja')
  final double? discount;
  @override
  @JsonKey(name: 'Statusi')
  final String? status;
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
  @JsonKey(name: 'Staff', fromJson: _boolFromInt)
  final bool staff;
  @override
  @JsonKey(name: 'AfatiPageses')
  final DateTime? paymentDue;
  @override
  @JsonKey(name: 'Comment')
  final String? comment;
  @override
  @JsonKey(name: 'tenant_id')
  final int? tenantId;
  @override
  @JsonKey(name: 'StatusFatureId')
  final int? statusId;
  @override
  @JsonKey(name: 'PagesaId')
  final int? paymentId;
  @override
  @JsonKey(name: 'KodiValues')
  final String? currencyCode;
  @override
  @JsonKey(name: 'KursiKembimit', fromJson: _doubleFromString)
  final double? exchangeRate;
// Relations
  @override
  @JsonKey(name: 'subjekti')
  final Subjekti? subject;
  @override
  @JsonKey(name: 'shfrytezuesi')
  final Shfrytezuesi? user;
  @override
  @JsonKey(name: 'fatura_kategoria')
  final FaturaKategoria? category;
  final List<Porosia>? _orders;
  @override
  @JsonKey(name: 'porosi')
  List<Porosia>? get orders {
    final value = _orders;
    if (value == null) return null;
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Pagesat>? _payments;
  @override
  @JsonKey(name: 'pagesat')
  List<Pagesat>? get payments {
    final value = _payments;
    if (value == null) return null;
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Fatura(id: $id, invoiceNumber: $invoiceNumber, date: $date, subjectId: $subjectId, userId: $userId, categoryId: $categoryId, totalWithoutVat: $totalWithoutVat, totalVat: $totalVat, total: $total, discount: $discount, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted, staff: $staff, paymentDue: $paymentDue, comment: $comment, tenantId: $tenantId, statusId: $statusId, paymentId: $paymentId, currencyCode: $currencyCode, exchangeRate: $exchangeRate, subject: $subject, user: $user, category: $category, orders: $orders, payments: $payments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaturaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.totalWithoutVat, totalWithoutVat) ||
                other.totalWithoutVat == totalWithoutVat) &&
            (identical(other.totalVat, totalVat) ||
                other.totalVat == totalVat) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.staff, staff) || other.staff == staff) &&
            (identical(other.paymentDue, paymentDue) ||
                other.paymentDue == paymentDue) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.exchangeRate, exchangeRate) ||
                other.exchangeRate == exchangeRate) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality().equals(other._payments, _payments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        invoiceNumber,
        date,
        subjectId,
        userId,
        categoryId,
        totalWithoutVat,
        totalVat,
        total,
        discount,
        status,
        createdAt,
        updatedAt,
        deleted,
        staff,
        paymentDue,
        comment,
        tenantId,
        statusId,
        paymentId,
        currencyCode,
        exchangeRate,
        subject,
        user,
        category,
        const DeepCollectionEquality().hash(_orders),
        const DeepCollectionEquality().hash(_payments)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaturaImplCopyWith<_$FaturaImpl> get copyWith =>
      __$$FaturaImplCopyWithImpl<_$FaturaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaturaImplToJson(
      this,
    );
  }
}

abstract class _Fatura implements Fatura {
  const factory _Fatura(
      {@JsonKey(name: 'Id') required final int id,
      @JsonKey(name: 'NrFatures') final String? invoiceNumber,
      @JsonKey(name: 'Data') final DateTime? date,
      @JsonKey(name: 'SubjektiId') final int? subjectId,
      @JsonKey(name: 'ShfrytezuesiId') final int? userId,
      @JsonKey(name: 'FaturaKategoriaId') final int? categoryId,
      @JsonKey(name: 'TotaliPaTvsh') final double? totalWithoutVat,
      @JsonKey(name: 'TotaliTvsh') final double? totalVat,
      @JsonKey(name: 'Totali') final double? total,
      @JsonKey(name: 'Zbritja') final double? discount,
      @JsonKey(name: 'Statusi') final String? status,
      @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) final bool deleted,
      @JsonKey(name: 'Staff', fromJson: _boolFromInt) final bool staff,
      @JsonKey(name: 'AfatiPageses') final DateTime? paymentDue,
      @JsonKey(name: 'Comment') final String? comment,
      @JsonKey(name: 'tenant_id') final int? tenantId,
      @JsonKey(name: 'StatusFatureId') final int? statusId,
      @JsonKey(name: 'PagesaId') final int? paymentId,
      @JsonKey(name: 'KodiValues') final String? currencyCode,
      @JsonKey(name: 'KursiKembimit', fromJson: _doubleFromString)
      final double? exchangeRate,
      @JsonKey(name: 'subjekti') final Subjekti? subject,
      @JsonKey(name: 'shfrytezuesi') final Shfrytezuesi? user,
      @JsonKey(name: 'fatura_kategoria') final FaturaKategoria? category,
      @JsonKey(name: 'porosi') final List<Porosia>? orders,
      @JsonKey(name: 'pagesat') final List<Pagesat>? payments}) = _$FaturaImpl;

  factory _Fatura.fromJson(Map<String, dynamic> json) = _$FaturaImpl.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'NrFatures')
  String? get invoiceNumber;
  @override
  @JsonKey(name: 'Data')
  DateTime? get date;
  @override
  @JsonKey(name: 'SubjektiId')
  int? get subjectId;
  @override
  @JsonKey(name: 'ShfrytezuesiId')
  int? get userId;
  @override
  @JsonKey(name: 'FaturaKategoriaId')
  int? get categoryId;
  @override
  @JsonKey(name: 'TotaliPaTvsh')
  double? get totalWithoutVat;
  @override
  @JsonKey(name: 'TotaliTvsh')
  double? get totalVat;
  @override
  @JsonKey(name: 'Totali')
  double? get total;
  @override
  @JsonKey(name: 'Zbritja')
  double? get discount;
  @override
  @JsonKey(name: 'Statusi')
  String? get status;
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
  @JsonKey(name: 'Staff', fromJson: _boolFromInt)
  bool get staff;
  @override
  @JsonKey(name: 'AfatiPageses')
  DateTime? get paymentDue;
  @override
  @JsonKey(name: 'Comment')
  String? get comment;
  @override
  @JsonKey(name: 'tenant_id')
  int? get tenantId;
  @override
  @JsonKey(name: 'StatusFatureId')
  int? get statusId;
  @override
  @JsonKey(name: 'PagesaId')
  int? get paymentId;
  @override
  @JsonKey(name: 'KodiValues')
  String? get currencyCode;
  @override
  @JsonKey(name: 'KursiKembimit', fromJson: _doubleFromString)
  double? get exchangeRate;
  @override // Relations
  @JsonKey(name: 'subjekti')
  Subjekti? get subject;
  @override
  @JsonKey(name: 'shfrytezuesi')
  Shfrytezuesi? get user;
  @override
  @JsonKey(name: 'fatura_kategoria')
  FaturaKategoria? get category;
  @override
  @JsonKey(name: 'porosi')
  List<Porosia>? get orders;
  @override
  @JsonKey(name: 'pagesat')
  List<Pagesat>? get payments;
  @override
  @JsonKey(ignore: true)
  _$$FaturaImplCopyWith<_$FaturaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaturaKategoria _$FaturaKategoriaFromJson(Map<String, dynamic> json) {
  return _FaturaKategoria.fromJson(json);
}

/// @nodoc
mixin _$FaturaKategoria {
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
  $FaturaKategoriaCopyWith<FaturaKategoria> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaturaKategoriaCopyWith<$Res> {
  factory $FaturaKategoriaCopyWith(
          FaturaKategoria value, $Res Function(FaturaKategoria) then) =
      _$FaturaKategoriaCopyWithImpl<$Res, FaturaKategoria>;
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
class _$FaturaKategoriaCopyWithImpl<$Res, $Val extends FaturaKategoria>
    implements $FaturaKategoriaCopyWith<$Res> {
  _$FaturaKategoriaCopyWithImpl(this._value, this._then);

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
abstract class _$$FaturaKategoriaImplCopyWith<$Res>
    implements $FaturaKategoriaCopyWith<$Res> {
  factory _$$FaturaKategoriaImplCopyWith(_$FaturaKategoriaImpl value,
          $Res Function(_$FaturaKategoriaImpl) then) =
      __$$FaturaKategoriaImplCopyWithImpl<$Res>;
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
class __$$FaturaKategoriaImplCopyWithImpl<$Res>
    extends _$FaturaKategoriaCopyWithImpl<$Res, _$FaturaKategoriaImpl>
    implements _$$FaturaKategoriaImplCopyWith<$Res> {
  __$$FaturaKategoriaImplCopyWithImpl(
      _$FaturaKategoriaImpl _value, $Res Function(_$FaturaKategoriaImpl) _then)
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
    return _then(_$FaturaKategoriaImpl(
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
class _$FaturaKategoriaImpl implements _FaturaKategoria {
  const _$FaturaKategoriaImpl(
      {required this.id,
      @JsonKey(name: 'Emri') this.name,
      @JsonKey(name: 'Kodi') this.code,
      @JsonKey(name: 'Pershkrimi') this.description,
      @JsonKey(name: 'TvshId') this.tvshId,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) this.deleted = false});

  factory _$FaturaKategoriaImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaturaKategoriaImplFromJson(json);

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
    return 'FaturaKategoria(id: $id, name: $name, code: $code, description: $description, tvshId: $tvshId, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaturaKategoriaImpl &&
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
  _$$FaturaKategoriaImplCopyWith<_$FaturaKategoriaImpl> get copyWith =>
      __$$FaturaKategoriaImplCopyWithImpl<_$FaturaKategoriaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaturaKategoriaImplToJson(
      this,
    );
  }
}

abstract class _FaturaKategoria implements FaturaKategoria {
  const factory _FaturaKategoria(
      {required final int id,
      @JsonKey(name: 'Emri') final String? name,
      @JsonKey(name: 'Kodi') final String? code,
      @JsonKey(name: 'Pershkrimi') final String? description,
      @JsonKey(name: 'TvshId') final int? tvshId,
      @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
      final bool deleted}) = _$FaturaKategoriaImpl;

  factory _FaturaKategoria.fromJson(Map<String, dynamic> json) =
      _$FaturaKategoriaImpl.fromJson;

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
  _$$FaturaKategoriaImplCopyWith<_$FaturaKategoriaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subjekti _$SubjektiFromJson(Map<String, dynamic> json) {
  return _Subjekti.fromJson(json);
}

/// @nodoc
mixin _$Subjekti {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Kodi')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Emertimi')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Furnitor')
  bool? get isSupplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'Bleres')
  bool? get isCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'NrUnik')
  String? get uniqueNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'NoFiskal')
  String? get fiscalNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'NoTVSH')
  String? get vatNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'NIB')
  String? get nib => throw _privateConstructorUsedError;
  @JsonKey(name: 'Adresa')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'Telefoni')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rabati')
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Pershkrimi')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'KontojaArketueshme')
  int? get receivableAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'KontojaPagueshme')
  int? get payableAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Limiti')
  double? get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  bool get deleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjektiCopyWith<Subjekti> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjektiCopyWith<$Res> {
  factory $SubjektiCopyWith(Subjekti value, $Res Function(Subjekti) then) =
      _$SubjektiCopyWithImpl<$Res, Subjekti>;
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt});
}

/// @nodoc
class _$SubjektiCopyWithImpl<$Res, $Val extends Subjekti>
    implements $SubjektiCopyWith<$Res> {
  _$SubjektiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? name = freezed,
    Object? isSupplier = freezed,
    Object? isCustomer = freezed,
    Object? uniqueNumber = freezed,
    Object? fiscalNumber = freezed,
    Object? vatNumber = freezed,
    Object? nib = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? discount = freezed,
    Object? description = freezed,
    Object? receivableAccount = freezed,
    Object? payableAccount = freezed,
    Object? limit = freezed,
    Object? deleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isSupplier: freezed == isSupplier
          ? _value.isSupplier
          : isSupplier // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCustomer: freezed == isCustomer
          ? _value.isCustomer
          : isCustomer // ignore: cast_nullable_to_non_nullable
              as bool?,
      uniqueNumber: freezed == uniqueNumber
          ? _value.uniqueNumber
          : uniqueNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fiscalNumber: freezed == fiscalNumber
          ? _value.fiscalNumber
          : fiscalNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vatNumber: freezed == vatNumber
          ? _value.vatNumber
          : vatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      nib: freezed == nib
          ? _value.nib
          : nib // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      receivableAccount: freezed == receivableAccount
          ? _value.receivableAccount
          : receivableAccount // ignore: cast_nullable_to_non_nullable
              as int?,
      payableAccount: freezed == payableAccount
          ? _value.payableAccount
          : payableAccount // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as double?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$SubjektiImplCopyWith<$Res>
    implements $SubjektiCopyWith<$Res> {
  factory _$$SubjektiImplCopyWith(
          _$SubjektiImpl value, $Res Function(_$SubjektiImpl) then) =
      __$$SubjektiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt});
}

/// @nodoc
class __$$SubjektiImplCopyWithImpl<$Res>
    extends _$SubjektiCopyWithImpl<$Res, _$SubjektiImpl>
    implements _$$SubjektiImplCopyWith<$Res> {
  __$$SubjektiImplCopyWithImpl(
      _$SubjektiImpl _value, $Res Function(_$SubjektiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? name = freezed,
    Object? isSupplier = freezed,
    Object? isCustomer = freezed,
    Object? uniqueNumber = freezed,
    Object? fiscalNumber = freezed,
    Object? vatNumber = freezed,
    Object? nib = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? discount = freezed,
    Object? description = freezed,
    Object? receivableAccount = freezed,
    Object? payableAccount = freezed,
    Object? limit = freezed,
    Object? deleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SubjektiImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isSupplier: freezed == isSupplier
          ? _value.isSupplier
          : isSupplier // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCustomer: freezed == isCustomer
          ? _value.isCustomer
          : isCustomer // ignore: cast_nullable_to_non_nullable
              as bool?,
      uniqueNumber: freezed == uniqueNumber
          ? _value.uniqueNumber
          : uniqueNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fiscalNumber: freezed == fiscalNumber
          ? _value.fiscalNumber
          : fiscalNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vatNumber: freezed == vatNumber
          ? _value.vatNumber
          : vatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      nib: freezed == nib
          ? _value.nib
          : nib // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      receivableAccount: freezed == receivableAccount
          ? _value.receivableAccount
          : receivableAccount // ignore: cast_nullable_to_non_nullable
              as int?,
      payableAccount: freezed == payableAccount
          ? _value.payableAccount
          : payableAccount // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as double?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$SubjektiImpl implements _Subjekti {
  const _$SubjektiImpl(
      {required this.id,
      @JsonKey(name: 'Kodi') this.code,
      @JsonKey(name: 'Emertimi') this.name,
      @JsonKey(name: 'Furnitor') this.isSupplier,
      @JsonKey(name: 'Bleres') this.isCustomer,
      @JsonKey(name: 'NrUnik') this.uniqueNumber,
      @JsonKey(name: 'NoFiskal') this.fiscalNumber,
      @JsonKey(name: 'NoTVSH') this.vatNumber,
      @JsonKey(name: 'NIB') this.nib,
      @JsonKey(name: 'Adresa') this.address,
      @JsonKey(name: 'Telefoni') this.phone,
      @JsonKey(name: 'Email') this.email,
      @JsonKey(name: 'Rabati') this.discount,
      @JsonKey(name: 'Pershkrimi') this.description,
      @JsonKey(name: 'KontojaArketueshme') this.receivableAccount,
      @JsonKey(name: 'KontojaPagueshme') this.payableAccount,
      @JsonKey(name: 'Limiti') this.limit,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) this.deleted = false,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt});

  factory _$SubjektiImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjektiImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'Kodi')
  final String? code;
  @override
  @JsonKey(name: 'Emertimi')
  final String? name;
  @override
  @JsonKey(name: 'Furnitor')
  final bool? isSupplier;
  @override
  @JsonKey(name: 'Bleres')
  final bool? isCustomer;
  @override
  @JsonKey(name: 'NrUnik')
  final String? uniqueNumber;
  @override
  @JsonKey(name: 'NoFiskal')
  final String? fiscalNumber;
  @override
  @JsonKey(name: 'NoTVSH')
  final String? vatNumber;
  @override
  @JsonKey(name: 'NIB')
  final String? nib;
  @override
  @JsonKey(name: 'Adresa')
  final String? address;
  @override
  @JsonKey(name: 'Telefoni')
  final String? phone;
  @override
  @JsonKey(name: 'Email')
  final String? email;
  @override
  @JsonKey(name: 'Rabati')
  final double? discount;
  @override
  @JsonKey(name: 'Pershkrimi')
  final String? description;
  @override
  @JsonKey(name: 'KontojaArketueshme')
  final int? receivableAccount;
  @override
  @JsonKey(name: 'KontojaPagueshme')
  final int? payableAccount;
  @override
  @JsonKey(name: 'Limiti')
  final double? limit;
  @override
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  final bool deleted;
  @override
  @JsonKey(name: 'DataEKrijimit')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Subjekti(id: $id, code: $code, name: $name, isSupplier: $isSupplier, isCustomer: $isCustomer, uniqueNumber: $uniqueNumber, fiscalNumber: $fiscalNumber, vatNumber: $vatNumber, nib: $nib, address: $address, phone: $phone, email: $email, discount: $discount, description: $description, receivableAccount: $receivableAccount, payableAccount: $payableAccount, limit: $limit, deleted: $deleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjektiImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isSupplier, isSupplier) ||
                other.isSupplier == isSupplier) &&
            (identical(other.isCustomer, isCustomer) ||
                other.isCustomer == isCustomer) &&
            (identical(other.uniqueNumber, uniqueNumber) ||
                other.uniqueNumber == uniqueNumber) &&
            (identical(other.fiscalNumber, fiscalNumber) ||
                other.fiscalNumber == fiscalNumber) &&
            (identical(other.vatNumber, vatNumber) ||
                other.vatNumber == vatNumber) &&
            (identical(other.nib, nib) || other.nib == nib) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.receivableAccount, receivableAccount) ||
                other.receivableAccount == receivableAccount) &&
            (identical(other.payableAccount, payableAccount) ||
                other.payableAccount == payableAccount) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        code,
        name,
        isSupplier,
        isCustomer,
        uniqueNumber,
        fiscalNumber,
        vatNumber,
        nib,
        address,
        phone,
        email,
        discount,
        description,
        receivableAccount,
        payableAccount,
        limit,
        deleted,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjektiImplCopyWith<_$SubjektiImpl> get copyWith =>
      __$$SubjektiImplCopyWithImpl<_$SubjektiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjektiImplToJson(
      this,
    );
  }
}

abstract class _Subjekti implements Subjekti {
  const factory _Subjekti(
          {required final int id,
          @JsonKey(name: 'Kodi') final String? code,
          @JsonKey(name: 'Emertimi') final String? name,
          @JsonKey(name: 'Furnitor') final bool? isSupplier,
          @JsonKey(name: 'Bleres') final bool? isCustomer,
          @JsonKey(name: 'NrUnik') final String? uniqueNumber,
          @JsonKey(name: 'NoFiskal') final String? fiscalNumber,
          @JsonKey(name: 'NoTVSH') final String? vatNumber,
          @JsonKey(name: 'NIB') final String? nib,
          @JsonKey(name: 'Adresa') final String? address,
          @JsonKey(name: 'Telefoni') final String? phone,
          @JsonKey(name: 'Email') final String? email,
          @JsonKey(name: 'Rabati') final double? discount,
          @JsonKey(name: 'Pershkrimi') final String? description,
          @JsonKey(name: 'KontojaArketueshme') final int? receivableAccount,
          @JsonKey(name: 'KontojaPagueshme') final int? payableAccount,
          @JsonKey(name: 'Limiti') final double? limit,
          @JsonKey(name: 'Fshire', fromJson: _boolFromInt) final bool deleted,
          @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
          @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt}) =
      _$SubjektiImpl;

  factory _Subjekti.fromJson(Map<String, dynamic> json) =
      _$SubjektiImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'Kodi')
  String? get code;
  @override
  @JsonKey(name: 'Emertimi')
  String? get name;
  @override
  @JsonKey(name: 'Furnitor')
  bool? get isSupplier;
  @override
  @JsonKey(name: 'Bleres')
  bool? get isCustomer;
  @override
  @JsonKey(name: 'NrUnik')
  String? get uniqueNumber;
  @override
  @JsonKey(name: 'NoFiskal')
  String? get fiscalNumber;
  @override
  @JsonKey(name: 'NoTVSH')
  String? get vatNumber;
  @override
  @JsonKey(name: 'NIB')
  String? get nib;
  @override
  @JsonKey(name: 'Adresa')
  String? get address;
  @override
  @JsonKey(name: 'Telefoni')
  String? get phone;
  @override
  @JsonKey(name: 'Email')
  String? get email;
  @override
  @JsonKey(name: 'Rabati')
  double? get discount;
  @override
  @JsonKey(name: 'Pershkrimi')
  String? get description;
  @override
  @JsonKey(name: 'KontojaArketueshme')
  int? get receivableAccount;
  @override
  @JsonKey(name: 'KontojaPagueshme')
  int? get payableAccount;
  @override
  @JsonKey(name: 'Limiti')
  double? get limit;
  @override
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  bool get deleted;
  @override
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SubjektiImplCopyWith<_$SubjektiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Shfrytezuesi _$ShfrytezuesiFromJson(Map<String, dynamic> json) {
  return _Shfrytezuesi.fromJson(json);
}

/// @nodoc
mixin _$Shfrytezuesi {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'Tel')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'Aktiv')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'Color')
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'RoleId')
  int? get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PunetoriId')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  bool get deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShfrytezuesiCopyWith<Shfrytezuesi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShfrytezuesiCopyWith<$Res> {
  factory $ShfrytezuesiCopyWith(
          Shfrytezuesi value, $Res Function(Shfrytezuesi) then) =
      _$ShfrytezuesiCopyWithImpl<$Res, Shfrytezuesi>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'Username') String? username,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'Tel') String? phone,
      @JsonKey(name: 'Aktiv') bool? active,
      @JsonKey(name: 'Color') String? color,
      @JsonKey(name: 'RoleId') int? roleId,
      @JsonKey(name: 'PunetoriId') int? employeeId,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted});
}

/// @nodoc
class _$ShfrytezuesiCopyWithImpl<$Res, $Val extends Shfrytezuesi>
    implements $ShfrytezuesiCopyWith<$Res> {
  _$ShfrytezuesiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? active = freezed,
    Object? color = freezed,
    Object? roleId = freezed,
    Object? employeeId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ShfrytezuesiImplCopyWith<$Res>
    implements $ShfrytezuesiCopyWith<$Res> {
  factory _$$ShfrytezuesiImplCopyWith(
          _$ShfrytezuesiImpl value, $Res Function(_$ShfrytezuesiImpl) then) =
      __$$ShfrytezuesiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'Username') String? username,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'Tel') String? phone,
      @JsonKey(name: 'Aktiv') bool? active,
      @JsonKey(name: 'Color') String? color,
      @JsonKey(name: 'RoleId') int? roleId,
      @JsonKey(name: 'PunetoriId') int? employeeId,
      @JsonKey(name: 'DataEKrijimit') DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted});
}

/// @nodoc
class __$$ShfrytezuesiImplCopyWithImpl<$Res>
    extends _$ShfrytezuesiCopyWithImpl<$Res, _$ShfrytezuesiImpl>
    implements _$$ShfrytezuesiImplCopyWith<$Res> {
  __$$ShfrytezuesiImplCopyWithImpl(
      _$ShfrytezuesiImpl _value, $Res Function(_$ShfrytezuesiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? active = freezed,
    Object? color = freezed,
    Object? roleId = freezed,
    Object? employeeId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
  }) {
    return _then(_$ShfrytezuesiImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
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
class _$ShfrytezuesiImpl implements _Shfrytezuesi {
  const _$ShfrytezuesiImpl(
      {required this.id,
      @JsonKey(name: 'Username') this.username,
      @JsonKey(name: 'Email') this.email,
      @JsonKey(name: 'Tel') this.phone,
      @JsonKey(name: 'Aktiv') this.active,
      @JsonKey(name: 'Color') this.color,
      @JsonKey(name: 'RoleId') this.roleId,
      @JsonKey(name: 'PunetoriId') this.employeeId,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) this.deleted = false});

  factory _$ShfrytezuesiImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShfrytezuesiImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'Username')
  final String? username;
  @override
  @JsonKey(name: 'Email')
  final String? email;
  @override
  @JsonKey(name: 'Tel')
  final String? phone;
  @override
  @JsonKey(name: 'Aktiv')
  final bool? active;
  @override
  @JsonKey(name: 'Color')
  final String? color;
  @override
  @JsonKey(name: 'RoleId')
  final int? roleId;
  @override
  @JsonKey(name: 'PunetoriId')
  final int? employeeId;
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
    return 'Shfrytezuesi(id: $id, username: $username, email: $email, phone: $phone, active: $active, color: $color, roleId: $roleId, employeeId: $employeeId, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShfrytezuesiImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, email, phone,
      active, color, roleId, employeeId, createdAt, updatedAt, deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShfrytezuesiImplCopyWith<_$ShfrytezuesiImpl> get copyWith =>
      __$$ShfrytezuesiImplCopyWithImpl<_$ShfrytezuesiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShfrytezuesiImplToJson(
      this,
    );
  }
}

abstract class _Shfrytezuesi implements Shfrytezuesi {
  const factory _Shfrytezuesi(
      {required final int id,
      @JsonKey(name: 'Username') final String? username,
      @JsonKey(name: 'Email') final String? email,
      @JsonKey(name: 'Tel') final String? phone,
      @JsonKey(name: 'Aktiv') final bool? active,
      @JsonKey(name: 'Color') final String? color,
      @JsonKey(name: 'RoleId') final int? roleId,
      @JsonKey(name: 'PunetoriId') final int? employeeId,
      @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
      final bool deleted}) = _$ShfrytezuesiImpl;

  factory _Shfrytezuesi.fromJson(Map<String, dynamic> json) =
      _$ShfrytezuesiImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'Username')
  String? get username;
  @override
  @JsonKey(name: 'Email')
  String? get email;
  @override
  @JsonKey(name: 'Tel')
  String? get phone;
  @override
  @JsonKey(name: 'Aktiv')
  bool? get active;
  @override
  @JsonKey(name: 'Color')
  String? get color;
  @override
  @JsonKey(name: 'RoleId')
  int? get roleId;
  @override
  @JsonKey(name: 'PunetoriId')
  int? get employeeId;
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
  _$$ShfrytezuesiImplCopyWith<_$ShfrytezuesiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Porosia _$PorosiaFromJson(Map<String, dynamic> json) {
  return _Porosia.fromJson(json);
}

/// @nodoc
mixin _$Porosia {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'FaturaId')
  int? get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProduktiId')
  int? get articleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Sasia')
  double? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Cmimi')
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rabati')
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Tvsh')
  double? get vatValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'IdTavolina')
  String? get tableId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Aktive')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShfrytezuesiId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fshire', fromJson: _boolFromInt)
  bool get deleted => throw _privateConstructorUsedError; // Relations
  @JsonKey(name: 'artikulli_baze')
  ArtikulliBaze? get article => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PorosiaCopyWith<Porosia> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PorosiaCopyWith<$Res> {
  factory $PorosiaCopyWith(Porosia value, $Res Function(Porosia) then) =
      _$PorosiaCopyWithImpl<$Res, Porosia>;
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted,
      @JsonKey(name: 'artikulli_baze') ArtikulliBaze? article});

  $ArtikulliBazeCopyWith<$Res>? get article;
}

/// @nodoc
class _$PorosiaCopyWithImpl<$Res, $Val extends Porosia>
    implements $PorosiaCopyWith<$Res> {
  _$PorosiaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceId = freezed,
    Object? articleId = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? discount = freezed,
    Object? vatValue = freezed,
    Object? tableId = freezed,
    Object? active = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
    Object? article = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceId: freezed == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as int?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      vatValue: freezed == vatValue
          ? _value.vatValue
          : vatValue // ignore: cast_nullable_to_non_nullable
              as double?,
      tableId: freezed == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$PorosiaImplCopyWith<$Res> implements $PorosiaCopyWith<$Res> {
  factory _$$PorosiaImplCopyWith(
          _$PorosiaImpl value, $Res Function(_$PorosiaImpl) then) =
      __$$PorosiaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) bool deleted,
      @JsonKey(name: 'artikulli_baze') ArtikulliBaze? article});

  @override
  $ArtikulliBazeCopyWith<$Res>? get article;
}

/// @nodoc
class __$$PorosiaImplCopyWithImpl<$Res>
    extends _$PorosiaCopyWithImpl<$Res, _$PorosiaImpl>
    implements _$$PorosiaImplCopyWith<$Res> {
  __$$PorosiaImplCopyWithImpl(
      _$PorosiaImpl _value, $Res Function(_$PorosiaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoiceId = freezed,
    Object? articleId = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? discount = freezed,
    Object? vatValue = freezed,
    Object? tableId = freezed,
    Object? active = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
    Object? article = freezed,
  }) {
    return _then(_$PorosiaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceId: freezed == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as int?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      vatValue: freezed == vatValue
          ? _value.vatValue
          : vatValue // ignore: cast_nullable_to_non_nullable
              as double?,
      tableId: freezed == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ArtikulliBaze?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PorosiaImpl implements _Porosia {
  const _$PorosiaImpl(
      {required this.id,
      @JsonKey(name: 'FaturaId') this.invoiceId,
      @JsonKey(name: 'ProduktiId') this.articleId,
      @JsonKey(name: 'Sasia') this.quantity,
      @JsonKey(name: 'Cmimi') this.price,
      @JsonKey(name: 'Rabati') this.discount,
      @JsonKey(name: 'Tvsh') this.vatValue,
      @JsonKey(name: 'IdTavolina') this.tableId,
      @JsonKey(name: 'Aktive') this.active,
      @JsonKey(name: 'ShfrytezuesiId') this.userId,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt,
      @JsonKey(name: 'Fshire', fromJson: _boolFromInt) this.deleted = false,
      @JsonKey(name: 'artikulli_baze') this.article});

  factory _$PorosiaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PorosiaImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'FaturaId')
  final int? invoiceId;
  @override
  @JsonKey(name: 'ProduktiId')
  final int? articleId;
  @override
  @JsonKey(name: 'Sasia')
  final double? quantity;
  @override
  @JsonKey(name: 'Cmimi')
  final double? price;
  @override
  @JsonKey(name: 'Rabati')
  final double? discount;
  @override
  @JsonKey(name: 'Tvsh')
  final double? vatValue;
  @override
  @JsonKey(name: 'IdTavolina')
  final String? tableId;
  @override
  @JsonKey(name: 'Aktive')
  final bool? active;
  @override
  @JsonKey(name: 'ShfrytezuesiId')
  final int? userId;
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
  @JsonKey(name: 'artikulli_baze')
  final ArtikulliBaze? article;

  @override
  String toString() {
    return 'Porosia(id: $id, invoiceId: $invoiceId, articleId: $articleId, quantity: $quantity, price: $price, discount: $discount, vatValue: $vatValue, tableId: $tableId, active: $active, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted, article: $article)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PorosiaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.vatValue, vatValue) ||
                other.vatValue == vatValue) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.article, article) || other.article == article));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      invoiceId,
      articleId,
      quantity,
      price,
      discount,
      vatValue,
      tableId,
      active,
      userId,
      createdAt,
      updatedAt,
      deleted,
      article);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PorosiaImplCopyWith<_$PorosiaImpl> get copyWith =>
      __$$PorosiaImplCopyWithImpl<_$PorosiaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PorosiaImplToJson(
      this,
    );
  }
}

abstract class _Porosia implements Porosia {
  const factory _Porosia(
          {required final int id,
          @JsonKey(name: 'FaturaId') final int? invoiceId,
          @JsonKey(name: 'ProduktiId') final int? articleId,
          @JsonKey(name: 'Sasia') final double? quantity,
          @JsonKey(name: 'Cmimi') final double? price,
          @JsonKey(name: 'Rabati') final double? discount,
          @JsonKey(name: 'Tvsh') final double? vatValue,
          @JsonKey(name: 'IdTavolina') final String? tableId,
          @JsonKey(name: 'Aktive') final bool? active,
          @JsonKey(name: 'ShfrytezuesiId') final int? userId,
          @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
          @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt,
          @JsonKey(name: 'Fshire', fromJson: _boolFromInt) final bool deleted,
          @JsonKey(name: 'artikulli_baze') final ArtikulliBaze? article}) =
      _$PorosiaImpl;

  factory _Porosia.fromJson(Map<String, dynamic> json) = _$PorosiaImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'FaturaId')
  int? get invoiceId;
  @override
  @JsonKey(name: 'ProduktiId')
  int? get articleId;
  @override
  @JsonKey(name: 'Sasia')
  double? get quantity;
  @override
  @JsonKey(name: 'Cmimi')
  double? get price;
  @override
  @JsonKey(name: 'Rabati')
  double? get discount;
  @override
  @JsonKey(name: 'Tvsh')
  double? get vatValue;
  @override
  @JsonKey(name: 'IdTavolina')
  String? get tableId;
  @override
  @JsonKey(name: 'Aktive')
  bool? get active;
  @override
  @JsonKey(name: 'ShfrytezuesiId')
  int? get userId;
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
  @JsonKey(name: 'artikulli_baze')
  ArtikulliBaze? get article;
  @override
  @JsonKey(ignore: true)
  _$$PorosiaImplCopyWith<_$PorosiaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pagesat _$PagesatFromJson(Map<String, dynamic> json) {
  return _Pagesat.fromJson(json);
}

/// @nodoc
mixin _$Pagesat {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataPageses')
  DateTime? get paymentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenyraPagesesId')
  int? get paymentMethodId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Totali')
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShumaPaguar')
  double? get amountPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'ArkaId')
  int? get cashRegisterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'BankaId')
  int? get bankId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Referenca')
  String? get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'Komenti')
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'Memo')
  String? get memo => throw _privateConstructorUsedError;
  @JsonKey(name: 'KrijuarNga')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Valuta')
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'KursiKembimit')
  double? get exchangeRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PagesatCopyWith<Pagesat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagesatCopyWith<$Res> {
  factory $PagesatCopyWith(Pagesat value, $Res Function(Pagesat) then) =
      _$PagesatCopyWithImpl<$Res, Pagesat>;
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'KursiKembimit') double? exchangeRate});
}

/// @nodoc
class _$PagesatCopyWithImpl<$Res, $Val extends Pagesat>
    implements $PagesatCopyWith<$Res> {
  _$PagesatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentDate = freezed,
    Object? paymentMethodId = freezed,
    Object? total = freezed,
    Object? amountPaid = freezed,
    Object? cashRegisterId = freezed,
    Object? bankId = freezed,
    Object? reference = freezed,
    Object? comment = freezed,
    Object? memo = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? currency = freezed,
    Object? exchangeRate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      amountPaid: freezed == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      cashRegisterId: freezed == cashRegisterId
          ? _value.cashRegisterId
          : cashRegisterId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeRate: freezed == exchangeRate
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagesatImplCopyWith<$Res> implements $PagesatCopyWith<$Res> {
  factory _$$PagesatImplCopyWith(
          _$PagesatImpl value, $Res Function(_$PagesatImpl) then) =
      __$$PagesatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'KursiKembimit') double? exchangeRate});
}

/// @nodoc
class __$$PagesatImplCopyWithImpl<$Res>
    extends _$PagesatCopyWithImpl<$Res, _$PagesatImpl>
    implements _$$PagesatImplCopyWith<$Res> {
  __$$PagesatImplCopyWithImpl(
      _$PagesatImpl _value, $Res Function(_$PagesatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentDate = freezed,
    Object? paymentMethodId = freezed,
    Object? total = freezed,
    Object? amountPaid = freezed,
    Object? cashRegisterId = freezed,
    Object? bankId = freezed,
    Object? reference = freezed,
    Object? comment = freezed,
    Object? memo = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? currency = freezed,
    Object? exchangeRate = freezed,
  }) {
    return _then(_$PagesatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      amountPaid: freezed == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      cashRegisterId: freezed == cashRegisterId
          ? _value.cashRegisterId
          : cashRegisterId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeRate: freezed == exchangeRate
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PagesatImpl implements _Pagesat {
  const _$PagesatImpl(
      {required this.id,
      @JsonKey(name: 'DataPageses') this.paymentDate,
      @JsonKey(name: 'MenyraPagesesId') this.paymentMethodId,
      @JsonKey(name: 'Totali') this.total,
      @JsonKey(name: 'ShumaPaguar') this.amountPaid,
      @JsonKey(name: 'ArkaId') this.cashRegisterId,
      @JsonKey(name: 'BankaId') this.bankId,
      @JsonKey(name: 'Referenca') this.reference,
      @JsonKey(name: 'Komenti') this.comment,
      @JsonKey(name: 'Memo') this.memo,
      @JsonKey(name: 'KrijuarNga') this.createdBy,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt,
      @JsonKey(name: 'Valuta') this.currency,
      @JsonKey(name: 'KursiKembimit') this.exchangeRate});

  factory _$PagesatImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagesatImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'DataPageses')
  final DateTime? paymentDate;
  @override
  @JsonKey(name: 'MenyraPagesesId')
  final int? paymentMethodId;
  @override
  @JsonKey(name: 'Totali')
  final double? total;
  @override
  @JsonKey(name: 'ShumaPaguar')
  final double? amountPaid;
  @override
  @JsonKey(name: 'ArkaId')
  final int? cashRegisterId;
  @override
  @JsonKey(name: 'BankaId')
  final int? bankId;
  @override
  @JsonKey(name: 'Referenca')
  final String? reference;
  @override
  @JsonKey(name: 'Komenti')
  final String? comment;
  @override
  @JsonKey(name: 'Memo')
  final String? memo;
  @override
  @JsonKey(name: 'KrijuarNga')
  final String? createdBy;
  @override
  @JsonKey(name: 'DataEModifikimit')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'Valuta')
  final String? currency;
  @override
  @JsonKey(name: 'KursiKembimit')
  final double? exchangeRate;

  @override
  String toString() {
    return 'Pagesat(id: $id, paymentDate: $paymentDate, paymentMethodId: $paymentMethodId, total: $total, amountPaid: $amountPaid, cashRegisterId: $cashRegisterId, bankId: $bankId, reference: $reference, comment: $comment, memo: $memo, createdBy: $createdBy, updatedAt: $updatedAt, currency: $currency, exchangeRate: $exchangeRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagesatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.cashRegisterId, cashRegisterId) ||
                other.cashRegisterId == cashRegisterId) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.exchangeRate, exchangeRate) ||
                other.exchangeRate == exchangeRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      paymentDate,
      paymentMethodId,
      total,
      amountPaid,
      cashRegisterId,
      bankId,
      reference,
      comment,
      memo,
      createdBy,
      updatedAt,
      currency,
      exchangeRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PagesatImplCopyWith<_$PagesatImpl> get copyWith =>
      __$$PagesatImplCopyWithImpl<_$PagesatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PagesatImplToJson(
      this,
    );
  }
}

abstract class _Pagesat implements Pagesat {
  const factory _Pagesat(
          {required final int id,
          @JsonKey(name: 'DataPageses') final DateTime? paymentDate,
          @JsonKey(name: 'MenyraPagesesId') final int? paymentMethodId,
          @JsonKey(name: 'Totali') final double? total,
          @JsonKey(name: 'ShumaPaguar') final double? amountPaid,
          @JsonKey(name: 'ArkaId') final int? cashRegisterId,
          @JsonKey(name: 'BankaId') final int? bankId,
          @JsonKey(name: 'Referenca') final String? reference,
          @JsonKey(name: 'Komenti') final String? comment,
          @JsonKey(name: 'Memo') final String? memo,
          @JsonKey(name: 'KrijuarNga') final String? createdBy,
          @JsonKey(name: 'DataEModifikimit') final DateTime? updatedAt,
          @JsonKey(name: 'Valuta') final String? currency,
          @JsonKey(name: 'KursiKembimit') final double? exchangeRate}) =
      _$PagesatImpl;

  factory _Pagesat.fromJson(Map<String, dynamic> json) = _$PagesatImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'DataPageses')
  DateTime? get paymentDate;
  @override
  @JsonKey(name: 'MenyraPagesesId')
  int? get paymentMethodId;
  @override
  @JsonKey(name: 'Totali')
  double? get total;
  @override
  @JsonKey(name: 'ShumaPaguar')
  double? get amountPaid;
  @override
  @JsonKey(name: 'ArkaId')
  int? get cashRegisterId;
  @override
  @JsonKey(name: 'BankaId')
  int? get bankId;
  @override
  @JsonKey(name: 'Referenca')
  String? get reference;
  @override
  @JsonKey(name: 'Komenti')
  String? get comment;
  @override
  @JsonKey(name: 'Memo')
  String? get memo;
  @override
  @JsonKey(name: 'KrijuarNga')
  String? get createdBy;
  @override
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'Valuta')
  String? get currency;
  @override
  @JsonKey(name: 'KursiKembimit')
  double? get exchangeRate;
  @override
  @JsonKey(ignore: true)
  _$$PagesatImplCopyWith<_$PagesatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenyraPageses _$MenyraPagesesFromJson(Map<String, dynamic> json) {
  return _MenyraPageses.fromJson(json);
}

/// @nodoc
mixin _$MenyraPageses {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Kodi')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Emertimi')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Kontoja')
  int? get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'FiskalType')
  int? get fiscalType => throw _privateConstructorUsedError;
  @JsonKey(name: 'PosEnabled')
  bool? get posEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSBorgji')
  bool? get posCredit => throw _privateConstructorUsedError;
  @JsonKey(name: 'KontojaKalimtare')
  String? get temporaryAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'KontimneKontoKalimtare')
  bool? get useTemporaryAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'KontojaeProvizioneve')
  String? get provisionAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'BankaId')
  int? get bankId => throw _privateConstructorUsedError;
  @JsonKey(name: 'JoFiskal')
  bool? get nonFiscal => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenyraPagesesCopyWith<MenyraPageses> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenyraPagesesCopyWith<$Res> {
  factory $MenyraPagesesCopyWith(
          MenyraPageses value, $Res Function(MenyraPageses) then) =
      _$MenyraPagesesCopyWithImpl<$Res, MenyraPageses>;
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt});
}

/// @nodoc
class _$MenyraPagesesCopyWithImpl<$Res, $Val extends MenyraPageses>
    implements $MenyraPagesesCopyWith<$Res> {
  _$MenyraPagesesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? name = freezed,
    Object? account = freezed,
    Object? fiscalType = freezed,
    Object? posEnabled = freezed,
    Object? posCredit = freezed,
    Object? temporaryAccount = freezed,
    Object? useTemporaryAccount = freezed,
    Object? provisionAccount = freezed,
    Object? bankId = freezed,
    Object? nonFiscal = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as int?,
      fiscalType: freezed == fiscalType
          ? _value.fiscalType
          : fiscalType // ignore: cast_nullable_to_non_nullable
              as int?,
      posEnabled: freezed == posEnabled
          ? _value.posEnabled
          : posEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      posCredit: freezed == posCredit
          ? _value.posCredit
          : posCredit // ignore: cast_nullable_to_non_nullable
              as bool?,
      temporaryAccount: freezed == temporaryAccount
          ? _value.temporaryAccount
          : temporaryAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      useTemporaryAccount: freezed == useTemporaryAccount
          ? _value.useTemporaryAccount
          : useTemporaryAccount // ignore: cast_nullable_to_non_nullable
              as bool?,
      provisionAccount: freezed == provisionAccount
          ? _value.provisionAccount
          : provisionAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int?,
      nonFiscal: freezed == nonFiscal
          ? _value.nonFiscal
          : nonFiscal // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MenyraPagesesImplCopyWith<$Res>
    implements $MenyraPagesesCopyWith<$Res> {
  factory _$$MenyraPagesesImplCopyWith(
          _$MenyraPagesesImpl value, $Res Function(_$MenyraPagesesImpl) then) =
      __$$MenyraPagesesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
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
      @JsonKey(name: 'DataEModifikimit') DateTime? updatedAt});
}

/// @nodoc
class __$$MenyraPagesesImplCopyWithImpl<$Res>
    extends _$MenyraPagesesCopyWithImpl<$Res, _$MenyraPagesesImpl>
    implements _$$MenyraPagesesImplCopyWith<$Res> {
  __$$MenyraPagesesImplCopyWithImpl(
      _$MenyraPagesesImpl _value, $Res Function(_$MenyraPagesesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? name = freezed,
    Object? account = freezed,
    Object? fiscalType = freezed,
    Object? posEnabled = freezed,
    Object? posCredit = freezed,
    Object? temporaryAccount = freezed,
    Object? useTemporaryAccount = freezed,
    Object? provisionAccount = freezed,
    Object? bankId = freezed,
    Object? nonFiscal = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MenyraPagesesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as int?,
      fiscalType: freezed == fiscalType
          ? _value.fiscalType
          : fiscalType // ignore: cast_nullable_to_non_nullable
              as int?,
      posEnabled: freezed == posEnabled
          ? _value.posEnabled
          : posEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      posCredit: freezed == posCredit
          ? _value.posCredit
          : posCredit // ignore: cast_nullable_to_non_nullable
              as bool?,
      temporaryAccount: freezed == temporaryAccount
          ? _value.temporaryAccount
          : temporaryAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      useTemporaryAccount: freezed == useTemporaryAccount
          ? _value.useTemporaryAccount
          : useTemporaryAccount // ignore: cast_nullable_to_non_nullable
              as bool?,
      provisionAccount: freezed == provisionAccount
          ? _value.provisionAccount
          : provisionAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int?,
      nonFiscal: freezed == nonFiscal
          ? _value.nonFiscal
          : nonFiscal // ignore: cast_nullable_to_non_nullable
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
class _$MenyraPagesesImpl implements _MenyraPageses {
  const _$MenyraPagesesImpl(
      {required this.id,
      @JsonKey(name: 'Kodi') this.code,
      @JsonKey(name: 'Emertimi') this.name,
      @JsonKey(name: 'Kontoja') this.account,
      @JsonKey(name: 'FiskalType') this.fiscalType,
      @JsonKey(name: 'PosEnabled') this.posEnabled,
      @JsonKey(name: 'POSBorgji') this.posCredit,
      @JsonKey(name: 'KontojaKalimtare') this.temporaryAccount,
      @JsonKey(name: 'KontimneKontoKalimtare') this.useTemporaryAccount,
      @JsonKey(name: 'KontojaeProvizioneve') this.provisionAccount,
      @JsonKey(name: 'BankaId') this.bankId,
      @JsonKey(name: 'JoFiskal') this.nonFiscal,
      @JsonKey(name: 'DataEKrijimit') this.createdAt,
      @JsonKey(name: 'DataEModifikimit') this.updatedAt});

  factory _$MenyraPagesesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenyraPagesesImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'Kodi')
  final String? code;
  @override
  @JsonKey(name: 'Emertimi')
  final String? name;
  @override
  @JsonKey(name: 'Kontoja')
  final int? account;
  @override
  @JsonKey(name: 'FiskalType')
  final int? fiscalType;
  @override
  @JsonKey(name: 'PosEnabled')
  final bool? posEnabled;
  @override
  @JsonKey(name: 'POSBorgji')
  final bool? posCredit;
  @override
  @JsonKey(name: 'KontojaKalimtare')
  final String? temporaryAccount;
  @override
  @JsonKey(name: 'KontimneKontoKalimtare')
  final bool? useTemporaryAccount;
  @override
  @JsonKey(name: 'KontojaeProvizioneve')
  final String? provisionAccount;
  @override
  @JsonKey(name: 'BankaId')
  final int? bankId;
  @override
  @JsonKey(name: 'JoFiskal')
  final bool? nonFiscal;
  @override
  @JsonKey(name: 'DataEKrijimit')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'MenyraPageses(id: $id, code: $code, name: $name, account: $account, fiscalType: $fiscalType, posEnabled: $posEnabled, posCredit: $posCredit, temporaryAccount: $temporaryAccount, useTemporaryAccount: $useTemporaryAccount, provisionAccount: $provisionAccount, bankId: $bankId, nonFiscal: $nonFiscal, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenyraPagesesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.fiscalType, fiscalType) ||
                other.fiscalType == fiscalType) &&
            (identical(other.posEnabled, posEnabled) ||
                other.posEnabled == posEnabled) &&
            (identical(other.posCredit, posCredit) ||
                other.posCredit == posCredit) &&
            (identical(other.temporaryAccount, temporaryAccount) ||
                other.temporaryAccount == temporaryAccount) &&
            (identical(other.useTemporaryAccount, useTemporaryAccount) ||
                other.useTemporaryAccount == useTemporaryAccount) &&
            (identical(other.provisionAccount, provisionAccount) ||
                other.provisionAccount == provisionAccount) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.nonFiscal, nonFiscal) ||
                other.nonFiscal == nonFiscal) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      account,
      fiscalType,
      posEnabled,
      posCredit,
      temporaryAccount,
      useTemporaryAccount,
      provisionAccount,
      bankId,
      nonFiscal,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenyraPagesesImplCopyWith<_$MenyraPagesesImpl> get copyWith =>
      __$$MenyraPagesesImplCopyWithImpl<_$MenyraPagesesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenyraPagesesImplToJson(
      this,
    );
  }
}

abstract class _MenyraPageses implements MenyraPageses {
  const factory _MenyraPageses(
      {required final int id,
      @JsonKey(name: 'Kodi') final String? code,
      @JsonKey(name: 'Emertimi') final String? name,
      @JsonKey(name: 'Kontoja') final int? account,
      @JsonKey(name: 'FiskalType') final int? fiscalType,
      @JsonKey(name: 'PosEnabled') final bool? posEnabled,
      @JsonKey(name: 'POSBorgji') final bool? posCredit,
      @JsonKey(name: 'KontojaKalimtare') final String? temporaryAccount,
      @JsonKey(name: 'KontimneKontoKalimtare') final bool? useTemporaryAccount,
      @JsonKey(name: 'KontojaeProvizioneve') final String? provisionAccount,
      @JsonKey(name: 'BankaId') final int? bankId,
      @JsonKey(name: 'JoFiskal') final bool? nonFiscal,
      @JsonKey(name: 'DataEKrijimit') final DateTime? createdAt,
      @JsonKey(name: 'DataEModifikimit')
      final DateTime? updatedAt}) = _$MenyraPagesesImpl;

  factory _MenyraPageses.fromJson(Map<String, dynamic> json) =
      _$MenyraPagesesImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'Kodi')
  String? get code;
  @override
  @JsonKey(name: 'Emertimi')
  String? get name;
  @override
  @JsonKey(name: 'Kontoja')
  int? get account;
  @override
  @JsonKey(name: 'FiskalType')
  int? get fiscalType;
  @override
  @JsonKey(name: 'PosEnabled')
  bool? get posEnabled;
  @override
  @JsonKey(name: 'POSBorgji')
  bool? get posCredit;
  @override
  @JsonKey(name: 'KontojaKalimtare')
  String? get temporaryAccount;
  @override
  @JsonKey(name: 'KontimneKontoKalimtare')
  bool? get useTemporaryAccount;
  @override
  @JsonKey(name: 'KontojaeProvizioneve')
  String? get provisionAccount;
  @override
  @JsonKey(name: 'BankaId')
  int? get bankId;
  @override
  @JsonKey(name: 'JoFiskal')
  bool? get nonFiscal;
  @override
  @JsonKey(name: 'DataEKrijimit')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'DataEModifikimit')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$MenyraPagesesImplCopyWith<_$MenyraPagesesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
