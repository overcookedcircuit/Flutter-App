import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'product_model.dart';

Future<List<Product>> loadProducts() async {
  final String response = await rootBundle.loadString('assets/products.json');
  final data = await json.decode(response);
  return (data['products'] as List).map((e) => Product.fromJson(e)).toList();
}
