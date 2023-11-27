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
  List<CategoryInfo> categories = [
    CategoryInfo(name: 'Series', imageUrl: 'https://cdn.pixabay.com/photo/2022/02/21/06/11/tablet-7025855_640.jpg'),
    CategoryInfo(name: 'Places to Visit', imageUrl: 'https://media.istockphoto.com/id/1473421123/photo/young-woman-tourist-with-backpack-walking-at-haji-lane-in-singapore.webp?b=1&s=612x612&w=0&k=20&c=X1hqa2dowWkFtd63HwYFOPg1EEwa6Yh9j6rlgeSWIKo='),
    // Add more categories as needed
  ];

  void addCategory(String newCategory) {
    setState(() {
      categories.add(CategoryInfo(name: newCategory, imageUrl: 'https://example.com/custom_image.jpg'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo App'),
      ),
      drawer: AppDrawer(
        categories: categories.map((category) => category.name).toList(),
        addCategory: addCategory,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the category page when an image is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(category: categories[index].name),
                ),
              );
            },
            child: Card(
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    categories[index].imageUrl,
                    height: 400.0,
                    width: 400.0,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200.0,
                        width: 200.0,
                        color: Colors.grey, // Placeholder color
                        child: Center(
                          child: Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 8.0),
                  Text(categories[index].name),
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}

class CategoryInfo {
  final String name;
  final String imageUrl;

  CategoryInfo({required this.name, required this.imageUrl});
}
