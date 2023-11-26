import 'package:flutter/material.dart';
import 'CategoryPage.dart';
import 'AddCategory.dart';
import 'Data.dart';

class AppDrawer extends StatelessWidget {
  final List<String> categories;
  final Function(String) addCategory;

  AppDrawer({required this.categories, required this.addCategory});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Add New Category'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCategoryPage(addCategory: addCategory),
                ),
              );

            },
          ),
          for (var category in categories)
            ListTile(
              title: Text(category),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(category: category),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
