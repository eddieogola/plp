import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/data/services/seller_service.dart';
import 'package:plp/ui/components/home/carousel.dart';
import 'package:plp/ui/components/home/products_grid.dart';
import 'package:plp/ui/components/shop/shop_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> sellerList = ['Hello', 'YEs'];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var sellers = await SellerService.getSellers();
    if (sellers != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      DataCarousel(sellerList),
      ShopList(),
    ]));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
