// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bill _$$_BillFromJson(Map<String, dynamic> json) => _$_Bill(
      id: json['id'] as String,
      total: (json['total'] as num?)?.toDouble(),
      userInfo: json['userInfo'] == null
          ? null
          : Customer.fromJson(json['userInfo'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool? ?? false,
      amountOwed: (json['amountOwed'] as num?)?.toDouble() ?? 0,
      created: json['created'] as String?,
      lastUpdated: json['lastUpdated'] as String?,
      note: json['note'] as String?,
      invoice: json['invoice'] as String?,
    );

Map<String, dynamic> _$$_BillToJson(_$_Bill instance) => <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'userInfo': instance.userInfo,
      'isSuccess': instance.isSuccess,
      'amountOwed': instance.amountOwed,
      'created': instance.created,
      'lastUpdated': instance.lastUpdated,
      'note': instance.note,
      'invoice': instance.invoice,
    };
