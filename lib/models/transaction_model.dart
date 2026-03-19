import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

enum TransactionType { income, expense }

enum Category { salary, investment, gift, refund, other }

const uuid = Uuid();

@freezed
sealed class TransactionModel with _$TransactionModel {
  @JsonSerializable(explicitToJson: true)
  const factory TransactionModel({
    required String id,
    required TransactionType transactionType,
    required String title,
    required double amount,
    required DateTime date,
    required Category category,
    required String note,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
  factory TransactionModel.add({
    required TransactionType transactionType,
    required String title,
    required double amount,
    required DateTime date,
    required Category category,
    required String note,
  }) {
    return TransactionModel(
      id: uuid.v4(),
      transactionType: transactionType,
      title: title,
      amount: amount,
      date: date,
      category: category,
      note: note,
    );
  }
}
