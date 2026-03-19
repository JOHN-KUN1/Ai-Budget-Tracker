// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      id: json['id'] as String,
      transactionType: $enumDecode(
        _$TransactionTypeEnumMap,
        json['transactionType'],
      ),
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      note: json['note'] as String,
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionType': _$TransactionTypeEnumMap[instance.transactionType]!,
      'title': instance.title,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'category': _$CategoryEnumMap[instance.category]!,
      'note': instance.note,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};

const _$CategoryEnumMap = {
  Category.salary: 'salary',
  Category.investment: 'investment',
  Category.gift: 'gift',
  Category.refund: 'refund',
  Category.other: 'other',
};
