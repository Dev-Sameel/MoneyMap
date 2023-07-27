import 'package:flutter/material.dart';
import 'package:money_management_app/data_base/transaction/transaction_db.dart';
import '../../models/category/category_model.dart';

class Amounts {
  Amounts._internal();
  static Amounts instance = Amounts._internal();
  factory Amounts() {
    return instance;
  }
  ValueNotifier<double> incomeNotifier = ValueNotifier(0);
  ValueNotifier<double> expenseNotifier = ValueNotifier(0);
  ValueNotifier<double> totalNotifier = ValueNotifier(0);

  Future<void> balanceAmount() async {
    await TransactionDB.instance.getAllTransaction().then((value) {
      expenseNotifier.value = 0;

      incomeNotifier.value = 0;
      totalNotifier.value = 0;

      for (var item in value) {
        if (item.type == CategoryType.icome) {
          incomeNotifier.value += item.amount;
        } else {
          expenseNotifier.value += item.amount;
        }
      }
      totalNotifier.value = incomeNotifier.value - expenseNotifier.value;
    });
  }
}
