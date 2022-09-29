

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ProductCard extends StatelessWidget {
 final VoidCallback press;
  final String imageUrl;

  const ProductCard({
    Key? key,
    required this.imageUrl,
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
                tag: "Sukuma",
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
              // products is out demo list
              "Title goes",
              style: TextStyle(color: Colors.red),
            ),
          ),
          Text(
            "\$ Price goes",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}