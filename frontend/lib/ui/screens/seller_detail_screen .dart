import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/ui/components/details/product_details.dart';
import 'package:plp/ui/components/details/products_carousel.dart';
import 'package:plp/ui/components/home/carousel.dart';
import 'package:plp/ui/components/map/map_utils.dart';
import 'package:plp/ui/screens/order_tracking_screen.dart';

class SellerDetailScreen extends StatelessWidget {
  const SellerDetailScreen(@required this.seller, {super.key});

  final Seller seller;

  @override
  Widget build(BuildContext context) {
    final color = getColor();
    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(color: color),
          child: Center(
              child: Text(
            seller.name,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: const Offset(0, -4),
                    blurRadius: 8,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  location(
                      color: color,
                      seller: seller,
                      tap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => OrderTrackingScreen(
                                        address: seller.address))))
                          }),
                  SizedBox(
                    height:10,
                  ),
                  Text(
                    'Products',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ProductDataCarousel(
                    productList: seller.product,
                    ),
                    SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

Widget location({seller, tap, color}) {
  return 
     GestureDetector(
      onTap: tap,
      child: Row(
        children: [
          Icon(
            Icons.location_on_rounded,
            color: color,
            size: 34.0,
          ),
          SizedBox(
            width: 10,
          ),
          Text(seller.address[0].city)
        ],
      ),

  );
}
