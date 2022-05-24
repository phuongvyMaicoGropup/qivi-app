import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'customer.dart';
part 'bill.freezed.dart';
part 'bill.g.dart';

@freezed
class Bill with _$Bill {
  const factory Bill({
    required String id,
    double? total,
    Customer? userInfo,
    @Default(false) bool isSuccess,
    @Default(0) double amountOwed,
    String? created,
    String? lastUpdated,
    String? note,
    String? invoice,
  }) = _Bill;

  factory Bill.fromJson(Map<String, Object?> json) => _$BillFromJson(json);
}
