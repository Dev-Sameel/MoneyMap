import 'package:flutter/material.dart';
import '../../subScreens/refactoring/styles.dart';
import 'package:money_management_app/screens/mainScreens/transaction/add_transaction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data_base/category/category_db.dart';
import '../../../data_base/balance/balance_db.dart';
import '../../../data_base/transaction/transaction_db.dart';
import '../../subScreens/refactoring/container_shadow.dart';
import '../../subScreens/refactoring/home_cards.dart';
import 'recent_trans.dart';
import '../../subScreens/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String username = '';

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Amounts.instance.balanceAmount();
    CategoryDB.instance.refreshUI();
    TransactionDB.instance.refresh();
    autoLogIn();
    super.initState();
  }

  void autoLogIn() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('nameKey').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUI();
    Amounts.instance.balanceAmount();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: barColor,
        title: Text(
          'Hi, $username',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Inder',
              color: Colors.white),
        ),
      ),
      endDrawer: const Setting(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(top: 20),
            width: double.infinity,
            height:height*0.34 ,
            decoration: containerShadow(BorderRadius.circular(20)),
            child: Column(
              children: [
                const Text('Account Balance',
                    style: TextStyle(
                        fontFamily: 'Inder',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                ValueListenableBuilder(
                    valueListenable: Amounts.instance.totalNotifier,
                    builder: (context, value, child) {
                      return Text(
                        Amounts.instance.totalNotifier.value.toString(),
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      );
                    }),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              CustomCard(
                           
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                icon: Icons.archive,
                                iconColor:
                                    const Color.fromARGB(221, 0, 26, 44),
                                title: 'Income',
                                valueNotifier:
                                    Amounts.instance.incomeNotifier,
                              ),
                              CustomCard(
                             
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                icon: Icons.unarchive,
                                iconColor:
                                    const Color.fromARGB(221, 0, 26, 44),
                                title: 'Expense',
                                valueNotifier:
                                    Amounts.instance.expenseNotifier,
                              ),
                            ],
                          ),
                          Positioned(
                              left: width / 3,
                              top: 15,
                              child: SizedBox(
                                width: width / 4.5,
                                height: width / 4.5,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AddTransaction(),
                                      ),
                                    );
                                  },
                                  elevation: 15,
                                  backgroundColor: barColor,
                                  foregroundColor: white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Icon(
                                    Icons.add_circle,
                                    size: 65,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(child: RecentTransaction()),
        ],
      ),
    );
  }
}
