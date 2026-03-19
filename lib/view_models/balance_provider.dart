import 'dart:math';

import 'package:budget_tracker/view_models/expense_provider.dart';
import 'package:budget_tracker/view_models/income_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balance_provider.g.dart';

@riverpod
int balance(Ref ref) {
  final income = ref.watch(incomeProvider);
  final expense = ref.watch(expenseProvider);
  return  income - expense;
}