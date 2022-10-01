import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/ui/components/details/product_details.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen(@required this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
        
          child: Stack(children: [
            CachedNetworkImage(
              imageUrl: product.imageUrl,
              errorWidget: (context, url, error) => Icon(Icons.error),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                value: downloadProgress.progress,
              )),
              fit: BoxFit.cover,
              width: 1000,
              height:MediaQuery.of(context).size.height * 0.6,
            ),
            Center(
              child: Text(product.name,
                  style: TextStyle(
                    backgroundColor: Colors.black.withOpacity(0.2),
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            )
          ]),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
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
            child: ProductDetails(product),
          ),
        )
      ]),
    );
  }
}
