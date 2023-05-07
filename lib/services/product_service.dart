import 'dart:convert';

import 'package:altamazee/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = 'https://altamaze.site/api';
  Future<List<ProductModel>> searchProduct(String query) async {
    final url = '$baseUrl/products?limit=16&name=$query';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      final result = data.map((e) => ProductModel.fromJson(e)).toList();
      return result;
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  getProducts() {}
}
