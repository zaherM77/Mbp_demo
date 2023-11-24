import 'package:flutter/material.dart';
import 'AppDrawer.dart';
import 'CategoryPage.dart';
import 'AddCategory.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ['Series', 'Places to Visit'];

  void addCategory(String newCategory) {
    setState(() {
      categories.add(newCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo App'),
      ),
      drawer: AppDrawer(
        categories: categories,
        addCategory: addCategory,
      ),
      body: Center(
        child: Text('Welcome to My Todo App'),
      ),
    );
  }
}
