import 'package:flutter/material.dart';
import 'package:ecommerce_shop/Home/profileScreen.dart';
import 'package:ecommerce_shop/Home/category_tabs.dart';
import 'package:ecommerce_shop/Home/cartPage.dart'; // Assuming you have a CartPage

class HomePage extends StatefulWidget {
  final String email;

  HomePage({Key? key, required this.email}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(email: email);
}

class _HomePageState extends State<HomePage> {
  final String email;

  _HomePageState({required this.email});

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
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          CategoryTabs(selectedIndex: 4), // Default to Men category for the homepage
          Expanded(
            child: Center(
              child: Text('Welcome to the Home Page'),
            ),
          ),
        ],
      ),
    );
  }
}


