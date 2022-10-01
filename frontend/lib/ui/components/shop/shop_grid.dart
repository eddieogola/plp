import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/ui/components/home/product_card.dart';
import 'package:plp/ui/screens/product_detail_screen.dart';

class ShopGrid extends StatelessWidget {
  const ShopGrid(this.products);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Color.fromARGB(255, 234, 243, 234),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ProductCard(
                  product: products[index],
                  imageUrl: products[index].imageUrl,
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          products[index],
                        ),
                      )),
                )),
      ),
    );
  }
}
