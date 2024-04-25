import 'package:flutter/material.dart';
import 'package:ecommerce_shop/profileScreen.dart';

class HomePage extends StatefulWidget {
  final String email; // Declare email here

  HomePage({Key? key, required this.email}) : super(key: key); // Make email required

  @override
  _HomePageState createState() => _HomePageState(email: email); // Pass email to the state
}

class _HomePageState extends State<HomePage> {
  final String email;
  int _selectedCategory = 0; // Make this non-nullable
  final List<String> _categories = ['Men', 'Women', 'Kids'];

  Map<String, List<Map<String, dynamic>>> categoryItems = {
    'Men': [
      {'name': 'Sneakers', 'image': 'assets/men_shoe.jpg'},
      {'name': 'Boots', 'image': 'assets/men_boot.jpg'},
      // Add other men items
    ],
    'Women': [
      {'name': 'Heels', 'image': 'assets/women_heel.jpg'},
      {'name': 'Flats', 'image': 'assets/women_flat.jpg'},
      // Add other women items
    ],
    'Kids': [
      {'name': 'Sandals', 'image': 'assets/kids_sandal.jpg'},
      {'name': 'School Shoes', 'image': 'assets/kids_shoe.jpg'},
      // Add other kids items
    ],
  };

  List<Map<String, dynamic>> _currentItems = [];

  @override
  void initState() {
    super.initState();
    _currentItems = categoryItems[_categories[_selectedCategory]] ?? [];
  }

  void _updateCategory(int? index) {
    if (index != null) {
      setState(() {
        _selectedCategory = index;
        _currentItems = categoryItems[_categories[_selectedCategory]]!;
      });
    }
  }

  _HomePageState({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: IconButton(
          icon: Icon(Icons.menu), // Use any icon that suits your app design
          onPressed: () {
            // Navigator.push to a new route/page
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfilePage(), // Replace with your destination page
            ));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Search bar code...

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List<Widget>.generate(
                  _categories.length,
                      (int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        label: Text(_categories[index]),
                        selected: _selectedCategory == index,
                        onSelected: (_) => _updateCategory(index),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: _currentItems.length,
                itemBuilder: (context, index) {
                  var item = _currentItems[index];
                  return ListTile(
                    leading: Image.asset(item['image'], fit: BoxFit.cover),
                    title: Text(item['name']),
                    onTap: () {
                      // Handle the item tap
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}