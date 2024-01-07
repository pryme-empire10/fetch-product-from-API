import 'package:flutter/material.dart';
import 'package:productapi/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  late ProductModel _productModel;

  ProductModel get product => _productModel;

  ProductModel selectedProduct() => product;// this is for the details Screen

  void getDetails(ProductModel product) {
    _productModel = product;//this is for the home screen
    notifyListeners();
  }
}
