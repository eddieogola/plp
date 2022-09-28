import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plp/controllers/home_controller.dart';
import 'package:plp/ui/components/home/carousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (_controller){
              if(_controller.isLoading)
                if(_controller.sellers.length>0)
                  return DataCarousel(_controller.sellers);
                else
                  return EmptyCarousel();
              else
                if(_controller.sellers.length>0)
                  return DataCarousel(_controller.sellers);
                else
                  return Container();
            },),
      ),
    );
  }
}
