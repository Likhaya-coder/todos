import 'package:flutter/material.dart';
import 'package:to_do_app/Widgets/todo_items.dart';
import 'package:to_do_app/classes/todos_data.dart';
import 'package:to_do_app/screens/add_item.dart';

class DisplayItem extends StatefulWidget {
  const DisplayItem({Key? key}) : super(key: key);

  @override
  State<DisplayItem> createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
  Map data = {};
  late Color colour;
  late String? userTitle;
  late String? userDesc;
  late String? userColor;

  final todoList = Todos.todoList();

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
      todoList.add(
        Todos(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: data['title'],
          desc: data['description'],
          color: data['color'],
        ),
      );
    });
  }

  Color _checkPriority(Todos todos) {
    if (todos.color == "red") {
      colour = Colors.red;
    } else if (todos.color == 'orange') {
      colour = Colors.orange;
    } else {
      colour = Colors.blue;
    }
    return colour;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var results = await Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => const AddItem(),
            ),
          );
          //print(results);
          setState(() {
            data = {
              'title': results['title'],
              'description': results['description'],
              'color': results['color'],
            };
          });
          _addNewTodo();
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
                Expanded(
                  child: TodoItem(
                    todo: todos,
                    checkIsItDone: _checkIfDone,
                    tileColor: _checkPriority(todos),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
