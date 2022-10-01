import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/ui/screens/seller_detail_screen%20.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EmptyCarousel extends StatelessWidget {
  const EmptyCarousel(this.headline, {super.key});
  final String headline;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.green.shade100,
      baseColor: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headline,
              style: TextStyle(
                  fontSize: headlineFontSize, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: displayAspecRatio,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DataCarousel extends StatefulWidget {
  const DataCarousel({
    required this.headline,
    required this.sellerList,
    super.key,
  });
  final List<Seller> sellerList;
  final String headline;

  @override
  State<DataCarousel> createState() => _DataCarouselState();
}

class _DataCarouselState extends State<DataCarousel> {
  int _currentIndex = 0;
  List<Widget> imageSlider = [];

  @override
  void initState() {
    imageSlider = widget.sellerList
        .map((seller) => Container(
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(children: [
                GestureDetector(
                  onTap: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SellerDetailScreen(seller)))),
                  child: CachedNetworkImage(
                    imageUrl: seller.product[0].imageUrl,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    )),
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                ),
                Positioned(
                    bottom: 90,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.4)),
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Text(
                          seller.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )))
              ]),
            )))
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.headline,
            style: TextStyle(
                fontSize: headlineFontSize, fontWeight: FontWeight.bold),
          ),
        ),
        CarouselSlider(
          items: imageSlider,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: displayAspecRatio,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.sellerList.map((e) {
            int index = widget.sellerList.indexOf(e);
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
