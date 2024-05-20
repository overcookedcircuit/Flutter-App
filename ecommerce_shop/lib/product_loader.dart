import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product_model.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://api.json-generator.com/templates/DusZoIBjSUdh/data?access_token=y2k1la7irgqtzl2nu2ybse0g2wai1cgdyq1rdf18'));

  if (response.statusCode == 200) {
    List<dynamic> productsJson = json.decode(response.body)['products'];
    return productsJson.map((json) => Product.fromJson(json as Map<String, dynamic>)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
