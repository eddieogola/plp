import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plp/ui/components/home/product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> products = ['Samosa', 'Chicken', 'Sukuma'];

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Color.fromARGB(255, 234, 243, 234),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ProductCard(
                    imageUrl: 'https://source.unsplash.com/random?sig=$index',
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Text(
                              // product: products[index],
                              'Hello'),
                        )),
                  )),
        ),
      ),
    );
  }
}
