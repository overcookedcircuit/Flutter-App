import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product_model.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://api.json-generator.com/templates/DusZoIBjSUdh/data?access_token=2l5z1xor5f3kt36cno96rjw039evy47jmxqh5lqc'));

  if (response.statusCode == 200) {
    List<dynamic> productsJson = json.decode(response.body)['products'];
    return productsJson.map((json) => Product.fromJson(json as Map<String, dynamic>)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
