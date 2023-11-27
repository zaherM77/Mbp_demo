import 'package:flutter/material.dart';
import 'Todo.dart';

class CategoryPage extends StatefulWidget {
  final String category;

  CategoryPage({required this.category});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Container> containerList = [];
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _addContainer();
                  },
                  icon: Icon(Icons.add),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black45,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ...containerList,
          ],
        ),
      ),
    );
  }

  void _addContainer() {
    TextEditingController todoTextController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Todo List Container'),
          content: TextField(
            controller: todoTextController,
            decoration: InputDecoration(
              hintText: 'Enter a title ',
              fillColor:Colors.black45,
            ),
            cursorColor: Colors.black45,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
        ),
            TextButton(
              onPressed: () {
                String todoTitle = todoTextController.text.trim();
                if (todoTitle.isNotEmpty) {
                  setState(() {
                    containerList.add(
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                todoTitle,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TodoListWidget(),
                          ],
                        ),
                      ),
                    );
                  });

                  Navigator.of(context).pop();
                }
              },
              child: Text('Add',),
              style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
             ),
            ),

        ),
      ],
        );
      },
    );
  }}

class TodoListWidget extends StatefulWidget {
  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  List<Todo> todoList = [];
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter Text',
                    fillColor:Colors.black45,
                ),
                cursorColor: Colors.black45,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  String todoText = textEditingController.text.trim();
                  if (todoText.isNotEmpty) {
                    todoList.add(Todo(todoText, false));
                    textEditingController.clear();
                  }
                });
              },
              icon: Icon(Icons.add),
              label: Text(''),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black45,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),

            ),
          ],
        ),
        SizedBox(height: 20),
        ListView.builder(
            shrinkWrap: true,
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todoList[index].text,
                  style: TextStyle(
                    decoration: todoList[index].isDone
                        ? TextDecoration.lineThrough: TextDecoration.none,
                  ),
                ),

                leading: Checkbox(
                  value: todoList[index].isDone,
                  onChanged: (bool? value) {
                    setState(() {
                      todoList[index].isDone = value ?? false;
                    });
                  },
                  activeColor: Colors.black45,
                ),
              );
            },
          ),
      ],
    );
  }
}
