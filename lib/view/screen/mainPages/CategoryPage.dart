import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final List<String> categories;

  const CategoryPage({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              // You can perform any action here when a category is tapped
              // For example, navigate to a page showing plants of this category
              Navigator.pop(context, categories[index]);
            },
          );
        },
      ),
    );
  }
}
