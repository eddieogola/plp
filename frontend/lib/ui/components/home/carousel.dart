import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EmptyCarousel extends StatelessWidget {
  const EmptyCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey,
      child: Column(
        children: [
          Text('No content'),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 16 / 9,
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
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DataCarousel extends StatefulWidget {
  const DataCarousel(List<Seller> this.sellerList, {super.key});

  final List<Seller> sellerList ;

  @override
  State<DataCarousel> createState() => _DataCarouselState();
}

class _DataCarouselState extends State<DataCarousel> {
  int _currentIndex = 0;
  List<Widget> imageSlider = [];

  @override
  void initState() {
    imageSlider = widget.sellerList
        .map((e) => Container(
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(children: [
                CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1664268336138-388b6e0b9366?ixlib=rb-1.2.1&dl=ahmed-f0S62Iduanw-unsplash.jpg&q=80&fm=jpg&crop=entropy&cs=tinysrgb',
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
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Dummy text",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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
      child: Column(children: [
        CarouselSlider(
          items: imageSlider,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
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
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
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
