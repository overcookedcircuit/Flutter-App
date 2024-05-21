import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String product_id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.product_id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      product_id: json['product_id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      price: json['price'] as double,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
    );
  }

  factory Product.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Product(
      product_id: data['product_id'] ?? '',
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      imageUrl: data['imageUrl'] ?? '',
      description: data['description'] ?? '',
      category: data['category'] ?? '',
    );
  }
}
