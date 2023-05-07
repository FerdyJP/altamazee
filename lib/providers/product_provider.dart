import 'dart:ffi';

import 'package:altamazee/models/product_model.dart';
import 'package:altamazee/services/product_service.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _product = [];

  List<ProductModel> get product => _product;

  set products(List<ProductModel> products) {
    _product = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
    } catch (e) {
      print(e);
    }
  }
}
