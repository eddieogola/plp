import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard(
      {super.key,
      required String this.city,
      Color this.color = Colors.green,
      required this.press});

  final String city;
  final Color color;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              city,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );;
  }
}
