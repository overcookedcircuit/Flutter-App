import 'package:flutter/material.dart';
import 'package:ecommerce_shop/Home/Men/menCatalog.dart';
import 'package:ecommerce_shop/Home/Women/womenCatalog.dart';
import 'package:ecommerce_shop/Home/Kids/kidCatalog.dart';

class CategoryTabs extends StatelessWidget {
  final int selectedIndex;

  CategoryTabs({required this.selectedIndex});

  void _updateCategory(BuildContext context, int index) {
    Widget nextPage;

    switch (index) {
      case 0:
        nextPage = MenCatalog();
        break;
      case 1:
        nextPage = WomenCatalog();
        break;
      case 2:
        nextPage = KidCatalog();
        break;
      default:
        nextPage = MenCatalog(); // Fallback to a default page
        break;
    }

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nextPage));
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ['Men', 'Women', 'Kids'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(
          categories.length,
              (int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ChoiceChip(
                label: Text(categories[index]),
                selected: selectedIndex == index,
                onSelected: (_) => _updateCategory(context, index),
              ),
            );
          },
        ),
      ),
    );
  }
}