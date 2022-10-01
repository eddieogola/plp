import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/data/services/seller_service.dart';
import 'package:plp/ui/components/map/city_card.dart';
import 'package:plp/ui/components/map/map_utils.dart';
import 'package:plp/ui/screens/order_tracking_screen.dart';

class CityListScreen extends StatelessWidget {
  const CityListScreen({required this.cityList, super.key});
  final List<String> cityList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: GridView(
            children: cityList
                .map(
                  (city) => CityCard(
                      city: city,
                      color: getColor(),
                      press: () => getAddresses(city, context)),
                )
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

getAddresses(String city, context) async {
  List<Address>? addresses = await SellerService.getAddresses(city);

  if (addresses != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => OrderTrackingScreen(addressList: addresses)),
      ),
    );
  }
}
