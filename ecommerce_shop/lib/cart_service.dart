import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'product_model.dart';

class CartService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addToCart(Product product) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _db.collection('carts').doc(user.uid).collection('items').add({
        'product_id': product.product_id,
        'name': product.name,
        'price': product.price,
        'imageUrl': product.imageUrl,
        'description': product.description,
        'quantity': 1,
      });
    }
  }

  Stream<List<Product>> getCartItems() {
    User? user = _auth.currentUser;
    if (user != null) {
      return _db.collection('carts').doc(user.uid).collection('items').snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => Product.fromDocument(doc)).toList();
      });
    }
    return Stream.empty();
  }
}
