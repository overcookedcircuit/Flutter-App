class Product {
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      category: json['category'] as String,
      price: json['price'] as double,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
    );
  }
}