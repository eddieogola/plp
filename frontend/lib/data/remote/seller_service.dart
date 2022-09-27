import 'package:http/http.dart' as http;
import 'package:plp/common/static_values.dart';
import 'package:plp/data/model/seller_model.dart';

var client = http.Client();

class SellerService {
  const SellerService._();

  static Future<List<Seller>?> getSellers() async {
    var uri = Uri.parse("${StaticValues.apiUrl}sellers/");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return sellerFromJson(json);
    }
  }

  static Future<List<String>?> getCities() async {
    var uri = Uri.parse("${StaticValues.apiUrl}sellers/?city=all");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      var cities = cityFromJson(json).expand((x) => x).toList();
      return cities;
    }
  }
}
