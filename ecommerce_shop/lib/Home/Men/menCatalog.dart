import 'package:flutter/material.dart';
import 'package:ecommerce_shop/Home/category_tabs.dart';

import '../profileScreen.dart';

class MenCatalog extends StatelessWidget {
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
          CategoryTabs(selectedIndex: 0),
          Expanded(
            child: Center(
              child: Text('Men\'s items will be displayed here.'),
            ),
          ),
        ],
      ),
    );
  }
}
