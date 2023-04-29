import 'package:flutter/material.dart';
import 'package:to_do_app/classes/todos_data.dart';
import 'package:to_do_app/screens/add_item.dart';

class DisplayItem extends StatefulWidget {
  const DisplayItem({Key? key}) : super(key: key);

  @override
  State<DisplayItem> createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
  Map data = {};

  List<Todos> todos = [
    Todos(title: 'Wash a car', desc: 'I must wash a car with hot water'),
    Todos(title: 'Boil water', desc: 'I must wash a car with hot water'),
    Todos(title: 'Read the news', desc: 'Thursday at 3:30 on channel 404'),
    Todos(title: 'Wash a car', desc: 'I must wash a car with hot water'),
    Todos(title: 'Boil water', desc: 'I must wash a car with hot water'),
    Todos(title: 'Read the news', desc: 'Thursday at 3:30 on channel 404'),
    Todos(title: 'Wash a car', desc: 'I must wash a car with hot water'),
    Todos(title: 'Boil water', desc: 'I must wash a car with hot water'),
    Todos(title: 'Read the news', desc: 'Thursday at 3:30 on channel 404'),
    Todos(title: 'Wash a car', desc: 'I must wash a car with hot water'),
    Todos(title: 'Boil water', desc: 'I must wash a car with hot water'),
    Todos(title: 'Read the news', desc: 'Thursday at 3:30 on channel 404'),
  ];

  @override
  Widget build(BuildContext context) {
    bool? isChecked = true;

    var data = ModalRoute.of(context)?.settings.arguments;
    //final title = data['title'];
    //todos.add(data);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushReplacementNamed(context, '/addItem');
        },
        elevation: 1.0,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
          child: Column(
            children: [
              const Text(
                'To Do List',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    var item = todos[index];
                    return Dismissible(
                      background: Container(color: Colors.blue),
                      key: Key(item.toString()),
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 0.0),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    todos[index].title,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    todos[index].desc,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              Checkbox(
                                checkColor: Colors.white,
                                activeColor: Colors.green,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ), // child: ListTile(
                      ), // onDismissed: (direction) {
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
