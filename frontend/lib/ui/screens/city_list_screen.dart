import 'package:flutter/material.dart';
import 'package:plp/ui/components/map/city_card.dart';
import 'package:plp/ui/components/map/map_utils.dart';
import 'package:plp/ui/screens/order_tracking_screen.dart';

class CityListScreen extends StatelessWidget {
  const CityListScreen(this.cityList, {super.key});
  final List<String> cityList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: GridView(
            children: cityList
                .map((city) => CityCard(
                    city: city,
                    color: getColor(),
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => Text(''))))))
                .toList(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),
        ),
      ),
    );
    ;
  }
}
