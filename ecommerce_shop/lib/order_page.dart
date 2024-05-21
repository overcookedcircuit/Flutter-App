import 'package:flutter/material.dart';
import 'package:ecommerce_shop/cart_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: CartService().getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders found'));
          } else {
            final orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                final products = order['products'] as List<dynamic>;
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Order ${index + 1} - \$${order['total_price'].toStringAsFixed(2)}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: products.map((product) {
                        return Text('${product['name']} - \$${product['price'].toStringAsFixed(2)}');
                      }).toList(),
                    ),
                    trailing: Text(order['created_at'] != null ? (order['created_at'] as Timestamp).toDate().toString() : 'Date not available'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
