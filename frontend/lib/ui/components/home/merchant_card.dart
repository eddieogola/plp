import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:plp/data/model/seller_model.dart';

class MerchantCard extends StatelessWidget {
  const MerchantCard(
      {super.key,
      required Seller this.seller,
      Color this.color = Colors.white,
      required this.press});

  final Seller seller;
  final Color color;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(.2),
                  offset: const Offset(0, -4),
                  blurRadius: 8,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                seller.name,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                seller.address[0].city,
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
              SizedBox(
                height: 8,
              ),
              RatingBar.builder(
                ignoreGestures: true,
                itemSize: 10,
                initialRating: seller.rating.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
