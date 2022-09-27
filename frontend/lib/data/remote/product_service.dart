import 'package:http/http.dart' as http;
import 'package:plp/common/static_values.dart';
import 'package:plp/data/model/product_model.dart';

class ProductService {
  const ProductService._();

  static Future<List<Product>?> getProducts() async {
    var client = http.Client();
    var uri = Uri.parse("${StaticValues.apiUrl}products/");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return productFromJson(json);
    }
  }
} 
