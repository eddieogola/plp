import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:plp/data/remote/seller_service.dart';
import 'package:plp/ui/screens/home.dart';
import 'package:plp/ui/screens/map.dart';
import 'package:plp/ui/screens/shop.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Shop(),
    Map(),
  ];

  void _onItemTapped(int index) {
    getData();
    
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String>? cities;

  getData() async {
    cities = await SellerService.getCities();
    if (cities != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
