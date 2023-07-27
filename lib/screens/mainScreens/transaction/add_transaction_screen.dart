import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/data_base/balance/balance_db.dart';
import 'package:money_management_app/data_base/category/category_db.dart';
import 'package:money_management_app/data_base/graph/chart.dart';
import 'package:money_management_app/data_base/transaction/transaction_db.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';
import 'package:money_management_app/screens/mainScreens/category/category_popup.dart';
import 'package:money_management_app/screens/subScreens/refactoring/container_shadow.dart';
import 'package:money_management_app/screens/subScreens/refactoring/date_picker2.dart';
import 'package:money_management_app/screens/subScreens/refactoring/decoration.dart';
import 'package:money_management_app/screens/subScreens/refactoring/home_clipper.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import 'package:money_management_app/screens/subScreens/refactoring/styles.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategoryType;
  CategoryModel? _selectedCategoryModel;
  String? _categoryId;

  final _notesController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void initState() {
    _selectedCategoryType = CategoryType.icome;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        title: const Text(
          'Add Transaction',
          style: TextStyle(
              color: white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        centerTitle: true,
      ),
      backgroundColor:cardColor,
      body: Stack(
        children: [
          ClipPath(
            clipper: MyCustomClipper2(),
            child: Container(
              color: bgColor,
              width: double.infinity,
              height: 300,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
              decoration: BoxDecoration(
                
                image: const DecorationImage(
                    image: AssetImage('assets/images/addTranBg.png'),fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
                
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(76, 0, 0, 0),
                    blurRadius: 10.0,
                    spreadRadius: 1.0, 
                  )
                ],
              ),
              height: height * 0.75,
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 52, top: 10),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  activeColor: bgColor,
                                  value: CategoryType.icome,
                                  groupValue: _selectedCategoryType,
                                  onChanged: (newvalue) {
                                    setState(() {
                                      _selectedCategoryType =
                                          CategoryType.icome;
                                      _categoryId = null;
                                    });
                                  },
                                ),
                                const Text('Income'),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  activeColor: bgColor,
                                  value: CategoryType.expense,
                                  groupValue: _selectedCategoryType,
                                  onChanged: (newvalue) {
                                    setState(() {
                                      _selectedCategoryType =
                                          CategoryType.expense;
                                      _categoryId = null;
                                    });
                                  },
                                ),
                                const Text('Expense'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      sizeBox15(height),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Category',
                            style: textSTYL2,
                          ),
                          sizeBox7(height),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 250,
                              height: 45,
                              decoration: addDataBox(),
                              child: Center(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      enabledBorder:
                                          const UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                      focusedBorder:
                                          const UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            showCategoryAddPopup(context);
                                          },
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: bgColor,
                                          ))),
                                  dropdownColor: cardColor,
                                  value: _categoryId,
                                  items: (_selectedCategoryType ==
                                              CategoryType.icome
                                          ? CategoryDB.instance
                                              .incomeCategoryListListener
                                          : CategoryDB.instance
                                              .expenseCategoryListListener)
                                      .value
                                      .map((e) {
                                    return DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name),
                                      onTap: () {
                                        _selectedCategoryModel = e;
                                      },
                                    );
                                  }).toList(),
                                  onChanged: (selectedValue) {
                                    setState(() {
                                      _categoryId = selectedValue;
                                    });
                                  },
                                  hint: const Text(
                                    'Select Category',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              )),
                          sizeBox25(height),
                          const Text('Notes', style: textSTYL2),
                          sizeBox7(height),
                          Container(
                              width: 250,
                              height: 45,
                              decoration: addDataBox(),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 3),
                                child: InputDecor(
                                    textInputType: TextInputType.name,
                                    controller: _notesController,
                                    hintText: 'Enter Notes'),
                              )),
                          sizeBox25(height),
                          const Text('Amount', style: textSTYL2),
                          sizeBox7(height),
                          Container(
                              width: 250,
                              height: 45,
                              decoration: addDataBox(),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 3),
                                child: InputDecor(
                                    controller: _amountController,
                                    textInputType: TextInputType.number,
                                    hintText: 'Enter Amount'),
                              )),
                          sizeBox25(height),
                          const Text('Date', style: textSTYL2),
                          sizeBox7(height),
                          Container(
                              width: 250,
                              height: 45,
                              decoration: addDataBox(),
                              child: TextButton.icon(
                                style: const ButtonStyle(
                                    foregroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 0, 0, 0)),
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent)),
                                onPressed: () async {
                                  final selectedDateTemp =
                                      await datePicker2(context);
                                  if (selectedDateTemp == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      _selectedDate = selectedDateTemp;
                                    });
                                  }
                                },
                                icon: const Icon(Icons.calendar_today),
                                label: Text(
                                  _selectedDate == null
                                      ? 'Select Date'
                                      : DateFormat("dd-MMMM-yyyy")
                                          .format(_selectedDate!),
                                ),
                              )),
                          sizeBox40(height),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              shadowColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 226, 226, 226)),
                              elevation: MaterialStatePropertyAll(10),
                              backgroundColor:
                                  MaterialStatePropertyAll(bgColor)),
                          onPressed: () {
                            addTransaction();
                          },
                          child: const Text('ADD +'),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Future<void> addTransaction() async {
    final noteText = _notesController.text;
    final amountText = _amountController.text;

    if (noteText.isEmpty) {
      return;
    }
    if (amountText.isEmpty) {
      return;
    }
    if (_categoryId == null) {
      return;
    }
    if (_selectedDate == null) {
      return;
    }
    if (_selectedCategoryModel == null) {
      return;
    }
    final parsedAmount = double.tryParse(amountText);
    if (parsedAmount == null) {
      return;
    }

    final model = TransactionModel(
        purpose: noteText,
        amount: parsedAmount,
        date: _selectedDate!,
        type: _selectedCategoryType!,
        category: _selectedCategoryModel!,
        id: DateTime.now().millisecondsSinceEpoch.toString());
    await TransactionDB.instance.addTransaction(model);

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    filterFunction();
    TransactionDB.instance.refresh();
    Amounts.instance.balanceAmount();
    // ignore: use_build_context_synchronously
    showCustomSnackBar(context, 'Transaction added successfully');
  }
}
