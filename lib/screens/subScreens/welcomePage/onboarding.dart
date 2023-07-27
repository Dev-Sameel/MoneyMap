import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import 'package:money_management_app/screens/subScreens/welcomePage/user_registrasion.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(behavior: RemoveGlow(),
      child: OnBoardingScreen(
        onSkip: () async{
         
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserScreen()));
        },
        showPrevNextButton: true,
        showIndicator: true,
        backgourndColor: Colors.white,
        activeDotColor: Colors.blue,
        deactiveDotColor: Colors.grey,
        iconColor: Colors.black,
        leftIcon: Icons.arrow_circle_left_rounded,
        rightIcon: Icons.arrow_circle_right_rounded,
        iconSize: 30,
        pages: [
           OnBoardingModel(
            image: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Lottie.asset("assets/animations/girlHi.json"),
            ),
            title: "Money Map",
            body:
                "Welcome to Money Map.We can manage our daily income and expense easily.Please read instruction and use",
          ),
          OnBoardingModel(
            image: Image.asset("assets/images/onboarding/screen1.jpg"),
            title: "",
            body:
                "This is category section,Plus button used for add category.",
          ),
          OnBoardingModel(
            image: Image.asset("assets/images/onboarding/screen2.jpg"),
            title: "",
            body:
                "This is home section,Plus button used for add transaction.",
          ),
          OnBoardingModel(
            image: Image.asset("assets/images/onboarding/screen3.jpg"),
            title: "",
            body:
                "This is transaction record section,You can slide each transaction to the right to edit and delete.",
          ),
          OnBoardingModel(
            image: Image.asset("assets/images/onboarding/screen4.jpg"),
            title: "",
            body:
                "You just tap to view the transaction details",
          ),
        
        ],
      ),
    );
  }
}