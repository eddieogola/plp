

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';


class ProductCard extends StatelessWidget {
 final VoidCallback press;
  final String imageUrl;
  final Product product;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: product.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        imageUrl,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(
                            child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    )),
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20/ 4),
            child: Text(
              product.name,
              style: TextStyle(color: Colors.red),
            ),
          ),
          Text(
            "KShs.${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}