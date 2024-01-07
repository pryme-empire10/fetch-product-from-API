import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../services/product_services.dart';

class ProductFetcher extends ChangeNotifier {
  ProductServices productServices = ProductServices();
  List<ProductModel> _products = [];

  List<ProductModel> get product => _products;

  Future<void> getProductData() async {
    final response = await productServices.fetchProduct();
    _products = response;
    notifyListeners();
  }
}
