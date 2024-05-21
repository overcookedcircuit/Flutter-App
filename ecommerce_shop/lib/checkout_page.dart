import 'package:flutter/material.dart';
import 'cart_service.dart';
import 'product_model.dart';
import 'order_page.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: CartService().getCartItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No items in cart'));
          } else {
            final cartItems = snapshot.data!;
            double totalPrice = cartItems.fold(0, (sum, item) => sum + item.price);

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return ListTile(
                        leading: Image.asset(product.imageUrl, width: 50, height: 50),
                        title: Text(product.name),
                        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total: \$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          await CartService().createOrder(cartItems, totalPrice);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OrderPage()));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Checkout successful!')),
                          );
                        },
                        child: Text('Proceed to Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}