import 'package:http/http.dart' as http;
import 'package:plp/common/static_values.dart';
import 'package:plp/data/model/product_model.dart';
import 'package:plp/data/remote/network_helper.dart';

enum RequestType { get, put, post, delete }

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

  static Map<String, String> _getHeaders() =>
      {'Content-Type': 'application/json'};

  static Future<http.Response>? _createRequest({
    required RequestType requestType,
    required Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    if (requestType == RequestType.get) {
      return http.get(uri, headers: headers);
    }
  }

  static Future<http.Response?>? sendRequest({
    required RequestType requestType,
    required String url,
    Map<String, String>? body,
    Map<String, String>? queryParam,
  }) async {
    try {
      final _header = _getHeaders();
      final _url = NetworkHelper.concatUrlQueryParam(url, queryParam);

      final response = await _createRequest(
        requestType: requestType,
        uri: Uri.parse(_url),
        headers: _header,
        body: body,
      );

      return response;
    } catch (e) {
      print('Error = $e');
      return null;
    }
  }
}
