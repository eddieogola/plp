import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/data/services/seller_service.dart';
import 'package:plp/ui/screens/city_list_screen.dart';
import 'package:plp/ui/screens/loading_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapState();
}

class _MapState extends State<MapScreen> {
  List<String> cityList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    List<String>? cities = await SellerService.getCities();

    if (cities != null) {
      setState(() {
        cityList = cities;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: cityList.isEmpty
            ? LoadingScreen()
            : CityListScreen( cityList: cityList));
  }
}
