import 'package:flutter/material.dart';
import 'package:plp/data/services/seller_service.dart';
import 'package:plp/ui/components/map/city_card.dart';
import 'package:plp/ui/components/map/map_utils.dart';

class CityList extends StatefulWidget {
  const CityList({super.key});

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  List<String>? cities;
  List<Widget> cityCards = [];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    cities = await SellerService.getCities();
    if (cities != null) {
    
      setState(() {
        isLoaded = true;
        for (var city in cities!) {
        cityCards.add(CityCard(city: city, color: getColor()));
      }
      });
    }
  }


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
