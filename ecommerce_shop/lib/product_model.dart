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
      name: json['name'],
      category: json['category'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}