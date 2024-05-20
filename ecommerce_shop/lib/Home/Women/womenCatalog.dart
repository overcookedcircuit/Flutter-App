import 'package:flutter/material.dart';
import 'package:ecommerce_shop/product_loader.dart';
import 'package:ecommerce_shop/product_model.dart';
import '../category_tabs.dart';
import 'package:ecommerce_shop/product_detail.dart';
import 'package:ecommerce_shop/Home/profileScreen.dart';

class WomenCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfilePage(),
            ));
          },
        ),
      ),
      body: Column(
        children: [
          CategoryTabs(selectedIndex: 1),
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: loadProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No products found'));
                } else {
                  final products = snapshot.data!
                      .where((product) => product.category == 'Women')
                      .toList();
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                        leading: Image.asset(product.imageUrl, fit: BoxFit.cover),
                        title: Text(product.name),
                        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(product: product),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}