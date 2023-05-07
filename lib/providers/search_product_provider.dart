import 'package:altamazee/models/product_model.dart';
import 'package:flutter/material.dart';

import '../services/product_service.dart';

class SearchProductProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> results = [];
  Future<List<ProductModel>> searchProduct(String query) async {
    try {
      products = await ProductService().searchProduct(query);
      notifyListeners();
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }
}
