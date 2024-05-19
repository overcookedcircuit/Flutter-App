import 'package:flutter/material.dart';
import 'package:ecommerce_shop/Home/profileScreen.dart';
import 'package:ecommerce_shop/Home/category_tabs.dart';

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
      ),
      body: Column(
        children: [
          CategoryTabs(selectedIndex: 0), // Default to Men category for the homepage
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
