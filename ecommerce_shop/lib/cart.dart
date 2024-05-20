import 'product_model.dart';

class Cart {
  static final Cart _instance = Cart._internal();
  List<Product> _cartItems = [];

  factory Cart() {
    return _instance;
  }

  Cart._internal();

  void addToCart(Product product) {
    _cartItems.add(product);
  }

  List<Product> get cartItems => _cartItems;
}
