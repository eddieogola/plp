import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/ui/components/details/product_details.dart';
import 'package:plp/ui/screens/product_detail_screen.dart';

class ProductDataCarousel extends StatefulWidget {
  const ProductDataCarousel({
    required this.productList,
    super.key,
  });

  final List<Product> productList;

  @override
  State<ProductDataCarousel> createState() => _ProductDataCarouselState();
}

class _ProductDataCarouselState extends State<ProductDataCarousel> {
  int _currentIndex = 0;
  List<Widget> imageSlider = [];

  @override
  void initState() {
    imageSlider = widget.productList
        .map((product) => GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(product))),
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(children: [
                      CachedNetworkImage(
                        imageUrl: product.imageUrl,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        )),
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                      Positioned(
                          bottom: 80,
                          left: 0,
                          right: 0,
                          top: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4)),
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Text(
                                product.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )))
                    ]),
                  )),
            ))
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CarouselSlider(
          items: imageSlider,
          options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              aspectRatio: displayAspecRatio,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
        Center(child: Text(widget.productList[_currentIndex].summary, textAlign: TextAlign.center,)),
        SizedBox(height: 5,)
        ,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.productList.map((e) {
            int index = widget.productList.indexOf(e);
            return Container(
              width: 5,
              height: 5,
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        )
      ]),
    );
  }
}

final double headlineFontSize = 20;
final double displayAspecRatio = 21 / 9;
