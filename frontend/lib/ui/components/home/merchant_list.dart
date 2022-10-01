import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/ui/components/home/merchant_card.dart';
import 'package:plp/ui/screens/order_tracking_screen.dart';
import 'package:plp/ui/screens/seller_detail_screen%20.dart';

class MerchantList extends StatelessWidget {
  const MerchantList(this.sellerList, this.headline, {super.key});

  final List<Seller> sellerList;
  final String headline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            headline,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: sellerList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => MerchantCard(
              color: Colors.white,
                seller: sellerList[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            SellerDetailScreen(sellerList[index])))))),
      ],
    );
  }
}
