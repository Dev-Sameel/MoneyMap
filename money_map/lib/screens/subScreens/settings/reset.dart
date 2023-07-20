import 'package:flutter/material.dart';
import 'package:money_management_app/screens/subScreens/welcomePage/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data_base/category/category_db.dart';
import '../../../data_base/transaction/transaction_db.dart';


Future<void> resetMM(BuildContext ctx) async {
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  await sharedPrefs.clear();
  TransactionDB.instance.clearAllData();
  CategoryDB.instance.clearAllData();
  // ignore: use_build_context_synchronously
  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (ctx1) => const Onboarding(),
      ),
      (route) => false);
}
