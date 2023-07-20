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