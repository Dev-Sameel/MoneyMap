import 'package:flutter/material.dart';
import 'package:money_management_app/screens/subScreens/refactoring/styles.dart';
import '../../../data_base/category/category_db.dart';

Future<void> cateDelPop(BuildContext context, category) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: graphBlue,
          title: const Row(
            children: [
              Text('Delete',
                  style: TextStyle(
                      fontFamily: 'inder', fontWeight: FontWeight.w500)),
            ],
          ),
          content: SizedBox(
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Are you sure want to delete?',
                  style: TextStyle(fontFamily: 'inder'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 15),
                        )),
                    TextButton(
                        onPressed: () {
                          CategoryDB.instance.deleteCategory(category.id);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ok', style: TextStyle(fontSize: 15)))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
