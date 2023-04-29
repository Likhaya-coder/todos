import 'package:flutter/material.dart';
import 'package:to_do_app/Widgets/todo_items.dart';
import 'package:to_do_app/classes/todos_data.dart';

class DisplayItem extends StatefulWidget {
  const DisplayItem({Key? key}) : super(key: key);

  @override
  State<DisplayItem> createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
  Map data = {};

  final todoList = Todos.todoList();

  @override
  Widget build(BuildContext context) {
    bool? isChecked = true;

    var data = ModalRoute.of(context)?.settings.arguments;
    print(data);

    if(data != null) {
      _addNewTodo();
    }

    // setState(() {
    //   todoList.add(
    //     Todos(
    //       id: DateTime.now().millisecondsSinceEpoch.toString(),
    //       title: data['title'],
    //       desc: data['desc'],
    //     ),
    //   );
    // });


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
              const SizedBox(height: 20.0),
              for (Todos todos in todoList)
                TodoItem(
                  todo: todos,
                  checkIsItDone: _checkIfDone,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkIfDone(Todos todo) {
    setState(() {
      if (todo.isDone == true) {
        todo.isDone = false;
        print(todo.isDone);
      } else if (todo.isDone == false) {
        todo.isDone = true;
        print(todo.isDone);
      }
    });
  }

  void _addNewTodo() {
    setState(() {
    todoList.add(Todos(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: data['title'],
          desc: data['description']),
    );
  });
  }
}
