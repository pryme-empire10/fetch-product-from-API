import 'dart:convert';


import '../model/product_model.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://dummyjson.com/products';
class ProductServices {
  Future<List<ProductModel>> fetchProduct() async {
    final client = http.Client();
    final url = Uri.parse(baseUrl);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final result = json['products'] as List;
      final product = result.map((e) {
       return ProductModel.fromMap(e);
      }).toList();
      return product;
    } else {

      throw Exception("Failed to load product");
    }
  }
}
