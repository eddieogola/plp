import 'package:http/http.dart' as http;
import 'package:plp/common/static_values.dart';
import 'package:plp/data/model/seller_model.dart';

class SellerService {
  static var client = http.Client();

  static Future<List<Seller>?> getSellers() async {
    try {
      var uri = Uri.parse("${StaticValues.apiUrl}sellers/");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        return sellerFromJson(json);
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<List<String>?> getCities() async {
    try {
      var uri = Uri.parse("${StaticValues.apiUrl}sellers/?city=all");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        var cities = cityFromJson(json).expand((x) => x).toList();
        return cities;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<List<Address>?> getAddresses(String address) async {
    try {
      var uri = Uri.parse("${StaticValues.apiUrl}sellers/?address=${address}");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        var addresses = addressFromJson(json);
        return addresses;
      }
    } catch (e) {
      return null;
    }
  }
}
