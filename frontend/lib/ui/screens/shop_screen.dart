import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/data/services/product_service.dart';
import 'package:plp/ui/components/shop/shop_grid.dart';
import 'package:plp/ui/screens/loading_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
   List<Product> productList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var products = await ProductService.getProducts();

    if (products != null) {
      setState(() {
        products.forEach((product) {
          productList.add(product);
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: productList.isEmpty ? LoadingScreen() : ShopGrid(productList),
    );
  }
}
