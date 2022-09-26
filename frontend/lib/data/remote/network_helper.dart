import 'dart:convert';
import 'package:http/http.dart' as http;

enum NetworkResponseErrorType {
  socket,
  exception,
  responseEmpty,
  didNotSucceed,
}

enum CallbackParameterName { products }

extension CallbackParameterNameExtension on CallbackParameterName {
  dynamic getJson(json) {
    if (json == null) return null;
    switch(this){
      case CallbackParameterName.products:
        return json['products'];
    }
  }
}

typedef NetworkCallBack<R> = R Function(dynamic);
typedef NetworkOnFailureCallBackWithMessage<R> = R Function(
  NetworkResponseErrorType, String?);

class NetworkHelper {
  const NetworkHelper._();

  static String concatUrlQueryParam(
      String url, Map<String, String>? queryParams) {
    if (url.isEmpty) return url;
    if (queryParams == null || queryParams.isEmpty) return url;

    final StringBuffer stringBuffer = StringBuffer("$url?");
    queryParams.forEach((key, value) {
      if (value.trim().isEmpty) return;
      if (value.contains('')) {
        throw Exception("Invalid queryParams");
      }
      stringBuffer.write('$key=$value&');
    });

    final result = stringBuffer.toString();
    return result.substring(0, result.length - 1);
  }
}



bool _isValidResponse(json){
  return json != null && 
  json['status'] != null && 
  json['status'] == 'ok' && 
  json['products']!= null ;
}

R filterResponse<R>({
  required NetworkCallBack callBack,
  required http.Response? response,
  required NetworkOnFailureCallBackWithMessage onFailureCallBackWithMessage,
  CallbackParameterName parameterName = CallbackParameterName.products
}){
  try {

    if(response == null  || response.body.isEmpty){
      return onFailureCallBackWithMessage(NetworkResponseErrorType.responseEmpty,
        "Empty response");
    }

    var json = jsonDecode(response.body);

    if(response.statusCode == 200) {
      if(_isValidResponse(json)){
        return callBack(parameterName.getJson(json));
      }
    } else if(response.statusCode == 1708){
      return onFailureCallBackWithMessage(NetworkResponseErrorType.socket,'socket');
    }

    return onFailureCallBackWithMessage(NetworkResponseErrorType.didNotSucceed,'unknown');
    
  } catch (e) {
    return onFailureCallBackWithMessage(NetworkResponseErrorType.exception, "Exception: $e");
  }
}