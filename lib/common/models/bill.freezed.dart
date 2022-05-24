// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bill _$BillFromJson(Map<String, dynamic> json) {
  return _Bill.fromJson(json);
}

/// @nodoc
mixin _$Bill {
  String get id => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  Customer? get userInfo => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  double get amountOwed => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;
  String? get lastUpdated => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get invoice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillCopyWith<Bill> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillCopyWith<$Res> {
  factory $BillCopyWith(Bill value, $Res Function(Bill) then) =
      _$BillCopyWithImpl<$Res>;
  $Res call(
      {String id,
      double? total,
      Customer? userInfo,
      bool isSuccess,
      double amountOwed,
      String? created,
      String? lastUpdated,
      String? note,
      String? invoice});

  $CustomerCopyWith<$Res>? get userInfo;
}

/// @nodoc
class _$BillCopyWithImpl<$Res> implements $BillCopyWith<$Res> {
  _$BillCopyWithImpl(this._value, this._then);

  final Bill _value;
  // ignore: unused_field
  final $Res Function(Bill) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? total = freezed,
    Object? userInfo = freezed,
    Object? isSuccess = freezed,
    Object? amountOwed = freezed,
    Object? created = freezed,
    Object? lastUpdated = freezed,
    Object? note = freezed,
    Object? invoice = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as Customer?,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      amountOwed: amountOwed == freezed
          ? _value.amountOwed
          : amountOwed // ignore: cast_nullable_to_non_nullable
              as double,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: invoice == freezed
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $CustomerCopyWith<$Res>? get userInfo {
    if (_value.userInfo == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.userInfo!, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_BillCopyWith<$Res> implements $BillCopyWith<$Res> {
  factory _$$_BillCopyWith(_$_Bill value, $Res Function(_$_Bill) then) =
      __$$_BillCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      double? total,
      Customer? userInfo,
      bool isSuccess,
      double amountOwed,
      String? created,
      String? lastUpdated,
      String? note,
      String? invoice});

  @override
  $CustomerCopyWith<$Res>? get userInfo;
}

/// @nodoc
class __$$_BillCopyWithImpl<$Res> extends _$BillCopyWithImpl<$Res>
    implements _$$_BillCopyWith<$Res> {
  __$$_BillCopyWithImpl(_$_Bill _value, $Res Function(_$_Bill) _then)
      : super(_value, (v) => _then(v as _$_Bill));

  @override
  _$_Bill get _value => super._value as _$_Bill;

  @override
  $Res call({
    Object? id = freezed,
    Object? total = freezed,
    Object? userInfo = freezed,
    Object? isSuccess = freezed,
    Object? amountOwed = freezed,
    Object? created = freezed,
    Object? lastUpdated = freezed,
    Object? note = freezed,
    Object? invoice = freezed,
  }) {
    return _then(_$_Bill(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as Customer?,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      amountOwed: amountOwed == freezed
          ? _value.amountOwed
          : amountOwed // ignore: cast_nullable_to_non_nullable
              as double,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: invoice == freezed
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bill with DiagnosticableTreeMixin implements _Bill {
  const _$_Bill(
      {required this.id,
      this.total,
      this.userInfo,
      this.isSuccess = false,
      this.amountOwed = 0,
      this.created,
      this.lastUpdated,
      this.note,
      this.invoice});

  factory _$_Bill.fromJson(Map<String, dynamic> json) => _$$_BillFromJson(json);

  @override
  final String id;
  @override
  final double? total;
  @override
  final Customer? userInfo;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final double amountOwed;
  @override
  final String? created;
  @override
  final String? lastUpdated;
  @override
  final String? note;
  @override
  final String? invoice;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Bill(id: $id, total: $total, userInfo: $userInfo, isSuccess: $isSuccess, amountOwed: $amountOwed, created: $created, lastUpdated: $lastUpdated, note: $note, invoice: $invoice)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Bill'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('userInfo', userInfo))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('amountOwed', amountOwed))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('lastUpdated', lastUpdated))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('invoice', invoice));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bill &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.userInfo, userInfo) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality()
                .equals(other.amountOwed, amountOwed) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdated, lastUpdated) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.invoice, invoice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(userInfo),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(amountOwed),
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(lastUpdated),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(invoice));

  @JsonKey(ignore: true)
  @override
  _$$_BillCopyWith<_$_Bill> get copyWith =>
      __$$_BillCopyWithImpl<_$_Bill>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BillToJson(this);
  }
}

abstract class _Bill implements Bill {
  const factory _Bill(
      {required final String id,
      final double? total,
      final Customer? userInfo,
      final bool isSuccess,
      final double amountOwed,
      final String? created,
      final String? lastUpdated,
      final String? note,
      final String? invoice}) = _$_Bill;

  factory _Bill.fromJson(Map<String, dynamic> json) = _$_Bill.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  double? get total => throw _privateConstructorUsedError;
  @override
  Customer? get userInfo => throw _privateConstructorUsedError;
  @override
  bool get isSuccess => throw _privateConstructorUsedError;
  @override
  double get amountOwed => throw _privateConstructorUsedError;
  @override
  String? get created => throw _privateConstructorUsedError;
  @override
  String? get lastUpdated => throw _privateConstructorUsedError;
  @override
  String? get note => throw _privateConstructorUsedError;
  @override
  String? get invoice => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BillCopyWith<_$_Bill> get copyWith => throw _privateConstructorUsedError;
}
