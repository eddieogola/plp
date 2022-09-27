import 'package:flutter/material.dart';
import 'package:plp/data/model/product_model.dart';
import 'package:plp/data/remote/product_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product>? products;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    products = await ProductService.getProducts();
    if (products != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: products?.length,
          itemBuilder: (context, index) {
            return Visibility(
              visible: isLoaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: products?[index].name != null ? Text(products![index].name) : const Center(child: Text('Nothin to show'),
            ));
          }),
    );
  }
}
