import 'package:flutter/material.dart';

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

void showCustomSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 4),
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [Color.fromRGBO(212, 247, 145, 1), Color.fromRGBO(9, 191, 215, 1)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
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
