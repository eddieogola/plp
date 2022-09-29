import 'package:flutter/material.dart';
import 'package:plp/ui/screens/product_detail_screen.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductDetailScreen(),
    );
  }
}
