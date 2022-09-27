import 'package:flutter/material.dart';
import 'package:plp/data/remote/seller_service.dart';
import 'package:plp/ui/components/map/city_card.dart';
import 'package:plp/ui/components/map/map_utils.dart';

class CityList extends StatefulWidget {
  const CityList({super.key});

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  List<String>? cities;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    cities = await SellerService.getCities();
    if (cities != null) {
    for ( var city in cities!){
      cityCards.add(
        CityCard(city: city, color: getColor())
      );
    }

      setState(() {
        isLoaded = true;
      });
    }
  }

  List<Widget> cityCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            children: cityCards,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          ),
        ),
      ),
    );
  }
}
