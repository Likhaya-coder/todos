import 'package:flutter/material.dart';
import 'package:to_do_app/classes/todos_data.dart';

class TodoItem extends StatelessWidget {
  final Todos todo;
  final Function checkIsItDone;

  TodoItem({Key? key, required this.todo, required this.checkIsItDone})
      : super(key: key);

  final dismissibleKey = Todos.todoList();

  @override
  Widget build(BuildContext context) {
    String item = dismissibleKey.toString();
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        addAutomaticKeepAlives: false,
        children: [
          Dismissible(
            background: Container(color: Colors.indigo),
            key: Key(item.toString()),
            child: ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              tileColor: Colors.black38,
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontSize: 18.0,
                        decoration: todo.isDone == true ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(
                      todo.desc,
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: todo.isDone == true ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  checkIsItDone(todo);
                },
                icon: Icon(
                  todo.isDone == true ? Icons.check_box : Icons.check_box_outline_blank,
                  color: Colors.green,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
