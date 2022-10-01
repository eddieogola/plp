import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/data/services/seller_service.dart';
import 'package:plp/ui/components/home/carousel.dart';
import 'package:plp/ui/components/home/merchant_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  List<Seller> sellerList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var sellers = await SellerService.getSellers();

    if (sellers != null) {
      setState(() {
        sellers.forEach((seller) {
          sellerList.add(seller);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              child: sellerList.isNotEmpty
                  ? DataCarousel(sellerList: sellerList, headline: 'Top Picks')
                  : EmptyCarousel('Top Picks'),
            ),
            sellerList.isEmpty
                ? Center(
                    child: Text('Loading'),
                  )
                : MerchantList(sellerList, 'Merchants'),
          ],
        ),
      ),
    );
  }
}
