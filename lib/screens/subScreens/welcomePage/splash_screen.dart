import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_management_app/screens/subScreens/refactoring/styles.dart';
import 'package:money_management_app/screens/subScreens/welcomePage/bottom_nav.dart';
import 'package:money_management_app/screens/subScreens/welcomePage/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Lottie.asset('assets/animations/aaaa.json')),
        ],
      ),
    );
  }

  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx1) => const Onboarding(),
    ));
  }

  Future<void> checkUserLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLogged = sharedPrefs.getString('nameKey');
    if (userLogged == null) {
      gotoLogin();
    } else {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) {
        return;
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx1) => const BottomItemBar(),
      ));
    }
  }
}
