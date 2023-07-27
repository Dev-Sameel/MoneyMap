import 'package:flutter/material.dart';
import 'package:money_management_app/screens/mainScreens/statitics/graphs.dart';
import '../../subScreens/refactoring/styles.dart';
import 'package:money_management_app/screens/mainScreens/home/home_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../../mainScreens/category/add_category_screen.dart';
import '../../mainScreens/transaction/transaction_screen.dart';
class BottomItemBar extends StatefulWidget {
  const BottomItemBar({super.key});

  @override
  State<BottomItemBar> createState() => _BottomItemBarState();
}
  PageController _controller = PageController();
  int _selectedIndex = 0;

class _BottomItemBarState extends State<BottomItemBar> {
  @override
  void initState() {
    _controller = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children:const [
          HomeScreen(),
          TransactionScreen(),
          Statistics(),
          AddCategory(),
        ],
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: barColor,
        waterDropColor: white,
        bottomPadding: 5,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _controller.animateToPage(_selectedIndex,
              duration: const Duration(milliseconds: 1),
              curve: Curves.easeOutQuad);
        },
        selectedIndex: _selectedIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
              filledIcon: Icons.thumbs_up_down,
              outlinedIcon: Icons.thumbs_up_down_outlined),
          BarItem(
              filledIcon: Icons.leaderboard,
              outlinedIcon: Icons.leaderboard_outlined),
          BarItem(
              filledIcon: Icons.category,
              outlinedIcon: Icons.category_outlined),
        ],
      ),
    );

  }
}



