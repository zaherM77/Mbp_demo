import 'package:a_z_2dolapp/Category.dart';
import 'package:flutter/material.dart';
import 'Data.dart';
class AddCategoryPage extends StatefulWidget {
  final Function(String) addCategory;

  AddCategoryPage({required this.addCategory});

  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  TextEditingController _categoryController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String newCategory = _categoryController.text;
                widget.addCategory(newCategory); // Use the callback to add the new category
                Navigator.pop(context);
                categories.add(Category(newCategory));
              },
              child: Text('Add Category'),
            ),
          ],
        ),
      ),
    );
  }
}
