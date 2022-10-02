import 'package:flutter/material.dart';
import 'package:plp/ui/screens/start.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Sokomob';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const StartScreen(title: _title),
      debugShowCheckedModeBanner: false,
    );
  }
}
