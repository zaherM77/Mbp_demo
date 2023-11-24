import 'package:flutter/material.dart';

import 'AddCategory.dart';
import 'CategoryPage.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello world'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Series'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(category: 'Series'),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Places to Visit'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(category: 'Places to Visit'),
                  ),
                );
              },
            ),
            // Add the following ListTile to the Drawer in HomePage
            ListTile(
              title: Text('Add New Category'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCategoryPage(),
                  ),
                );
              },
            ),

          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to My Todo App'),
      ),
    );
  }
}