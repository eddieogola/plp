import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ShopList extends StatelessWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: quiltedLayout(context),
    );
  }
}

Widget quiltedLayout(BuildContext context) {
  return GridView.custom(
    gridDelegate: SliverQuiltedGridDelegate(
        mainAxisSpacing: 6,
        crossAxisSpacing: 4,
        crossAxisCount: 4,
        pattern: const [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 2),
        ]),
    childrenDelegate: SliverChildBuilderDelegate((context, index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: 'https://source.unsplash.com/random?sig=$index',
          errorWidget: (context, url, error) => Icon(Icons.error),
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: CircularProgressIndicator(
            value: downloadProgress.progress,
          )),
          fit: BoxFit.cover,
          width: 1000,
        ),
      );
    }),
  );
}
