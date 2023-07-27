import 'package:flutter/material.dart';
import 'package:money_management_app/screens/subScreens/refactoring/styles.dart';

dataEmpty(BuildContext context)
{
   return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Text(
          'Data is Empty',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(143, 199, 199, 199)
          ),
        ),
        SizedBox(height: 10,),
        Icon(
          Icons.warning,
          size: 35,
          color: Color.fromARGB(155, 219, 181, 179),
        ),
      ],
    ),
  );
}

void showCustomSnackBar(BuildContext context, String message, double n) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      height: 40,
      margin: EdgeInsets.only(left: n,right: n),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: snakbarGradient,
      ),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Inder',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class RemoveGlow extends ScrollBehavior
{
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child,_) {
    return child;
  }
}
