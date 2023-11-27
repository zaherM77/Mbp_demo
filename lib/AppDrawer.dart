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
      child: Container(
        color: Colors.blue, // Change the background color as desired
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Change the header background color
              ),
              child: Center(
                child: Text(
                  'My App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Add New Category',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCategoryPage(addCategory: addCategory),
                  ),
                );
              },
            ),
            Divider(
              color: Colors.white, // Add a divider line
            ),
            for (var category in categories)
              ListTile(
                title: Text(
                  category,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
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
      ),
    );
  }
}
