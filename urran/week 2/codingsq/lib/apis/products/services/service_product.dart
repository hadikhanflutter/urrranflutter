import 'dart:async';
import 'dart:io';

import 'package:codingsq/apis/products/utilities/rest_api_utilitties.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../model_post.dart';

class ServiceProduct {
  static var client = http.Client();
  static var duration = Duration(seconds: 10);

  static Future<List<ModelPost>> LoadProducts() async {
    List<ModelPost> list = [];
    try {
      Map<String, String> header = {};
      Map<String, String> body = {};

      // Map<String, dynamic> body = {'id': 1};
      Response response = await client
          .get(Uri.parse(RestApiUtilities.product_url))
          .timeout(duration);
      RestApiUtilities.GetPrintHeaderBodyUrlResponse(
        RestApiUtilities.product_url,
        header,
        body,
        response,
      );

      if (response.statusCode == 200) {
        list = modelPostFromMap(response.body);
        return list;
      } else {
        print(RestApiUtilities.GetresponseError(response.statusCode));
        return list;
      }
    } on TimeoutException {
      print(RestApiUtilities.GetresponseError(420));
      return list;
    } on SocketException {
      print(RestApiUtilities.GetresponseError(430));
      return list;
    } catch (e) {
      print('Error${e.toString()}');
      return list;
    }
  }
}
