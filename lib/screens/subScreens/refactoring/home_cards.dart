import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final ValueListenable valueNotifier;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const CustomCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.valueNotifier,
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(15),
      width: 140,
      height:140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 255, 246, 206),
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Icon(
            icon,
            size: 45,
            color: iconColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              mainAxisAlignment: mainAxisAlignment,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Inder',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (context, value, child) {
                    return Text(
                      valueNotifier.value.toString(),
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: iconColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
