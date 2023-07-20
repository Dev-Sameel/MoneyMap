import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/data_base/category/category_db.dart';
import 'package:money_management_app/data_base/balance/balance_db.dart';
import 'package:money_management_app/data_base/graph/chart.dart';
import 'package:money_management_app/data_base/transaction/transaction_db.dart';
import '../../subScreens/refactoring/styles.dart';
import 'package:money_management_app/screens/subScreens/refactoring/container_shadow.dart';
import 'package:money_management_app/screens/subScreens/refactoring/date_picker2.dart';
import 'package:money_management_app/screens/subScreens/refactoring/decoration.dart';
import '../../../models/category/category_model.dart';
import '../../../models/transaction/transaction_model.dart';
import '../../subScreens/refactoring/home_clipper.dart';

class EditTransaction extends StatefulWidget {
  const EditTransaction({super.key, required this.model});
  final TransactionModel model;

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategorytype;
  CategoryModel? _selectedCategoryModel;
  String? _categoryID;

  final purposeTextEditingController = TextEditingController();
  final amountTextEditingController = TextEditingController();

  @override
  void initState() {
    _selectedCategorytype = CategoryType.icome;
    purposeTextEditingController.text = widget.model.purpose;
    amountTextEditingController.text = widget.model.amount.toString();
    _selectedDate = widget.model.date;
    _selectedCategorytype = widget.model.type;
    _selectedCategoryModel = widget.model.category;
    _categoryID = widget.model.category.id;

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
          'Edit Transaction',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w500,
              fontSize: 18),
        ),
        centerTitle: true,
      ),
      backgroundColor: cardColor,
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
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 253, 253, 253),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(76, 0, 0, 0),
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
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
                                    groupValue: _selectedCategorytype,
                                    onChanged: (newvalue) {
                                      setState(() {
                                        _selectedCategorytype =
                                            CategoryType.icome;
                                        _categoryID = null;
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
                                    groupValue: _selectedCategorytype,
                                    onChanged: (newvalue) {
                                      setState(() {
                                        _selectedCategorytype =
                                            CategoryType.expense;
                                        _categoryID = null;
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
                                width: 200,
                                height: 45,
                                decoration: addDataBox(),
                                child: Center(
                                  child: DropdownButton<String>(
                                    dropdownColor: cardColor,
                                    value: _categoryID,
                                    underline: const SizedBox(),
                                    items: (_selectedCategorytype ==
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
                                        _categoryID = selectedValue;
                                      });
                                    },
                                    hint: Padding(
                                      padding: const EdgeInsets.only(right: 26),
                                      child:
                                          Text((_selectedCategoryModel!.name)),
                                    ),
                                  ),
                                )),
                            sizeBox25(height),
                            const Text('Notes', style: textSTYL2),
                            sizeBox7(height),
                            Container(
                                width: 200,
                                height: 45,
                                decoration: addDataBox(),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 3),
                                  child: InputDecor(
                                      controller: purposeTextEditingController,
                                      textInputType: TextInputType.number,
                                      hintText: 'Enter Notes'),
                                )),
                            sizeBox25(height),
                            const Text('Amount', style: textSTYL2),
                            sizeBox7(height),
                            Container(
                                width: 200,
                                height: 45,
                                decoration: addDataBox(),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 3),
                                  child: InputDecor(
                                      controller: amountTextEditingController,
                                      textInputType: TextInputType.number,
                                      hintText: 'Enter Amount'),
                                )),
                            sizeBox25(height),
                            const Text('Date', style: textSTYL2),
                            sizeBox7(height),
                            Container(
                                width: 200,
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
                            const SizedBox(
                              height: 40,
                            ),
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
                              editTransaction();
                            },
                            child: const Text('Update'),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Future<void> editTransaction() async {
    final purposeText = purposeTextEditingController.text.trim();
    final amountText = amountTextEditingController.text.trim();

    if (purposeText.isEmpty) {
      return;
    }
    if (amountText.isEmpty) {
      return;
    }
    if (_categoryID == null) {
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
        purpose: purposeText,
        amount: parsedAmount,
        date: _selectedDate!,
        type: _selectedCategorytype!,
        category: _selectedCategoryModel!,
        id: widget.model.id);
    await TransactionDB.instance.editTransaction(model);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    filterFunction();
    TransactionDB.instance.refresh();
    Amounts.instance.balanceAmount();
  }
}
