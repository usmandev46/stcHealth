import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/models.dart';
import '../Model/productDetailsModel.dart';
import '../customWidgets/customSharePreference.dart';

class ServicesMethod {
  static Future<bool> loginServices({var data}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      print("==========================  data is : $data}");

      var request = http.Request(
          'POST', Uri.parse('https://fakestoreapi.com/auth/login'));
      request.body = json.encode(data);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responsed = await http.Response.fromStream(response);
      var _data = jsonDecode(responsed.body);
      print("==========================  status is : ${responsed.statusCode}");
      print("==========================  body is : ${responsed.body}");
      if (responsed.statusCode == 200) {
        print(
            "==========================  status is >>> : ${responsed.statusCode}");
        print("==========================  body is >>???  : ${responsed.body}");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<List<ProductsModel>>? productServices() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        print("==========================  status is : ${response.statusCode}");
        print("==========================  body is : ${response.body}");
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<ProductsModel> productsList =
            jsonResponse.map((data) => ProductsModel.fromJson(data)).toList();
        return productsList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  static Future<dynamic>? productDetailsServices(String id) async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));
      if (response.statusCode == 200) {
        print("==========================  status is : ${response.statusCode}");
        print("==========================  body is : ${response.body}");

        return productsDetailsModelFromJson(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
