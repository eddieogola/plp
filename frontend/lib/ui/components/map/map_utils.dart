import 'package:flutter/material.dart';
import 'dart:math';

List<Color> colorList = [
  Colors.red,
  Colors.orange,
  Colors.amber,
  Colors.green,
  Colors.teal,
  Colors.blue,
  Colors.purple,
];

Color getColor() => colorList[Random().nextInt(colorList.length - 1)];