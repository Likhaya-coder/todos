import 'package:flutter/material.dart';
import 'package:to_do_app/classes/todos_data.dart';

class TodoItem extends StatelessWidget {
  final Todos todo;
  final Function checkIsItDone;
  final Color tileColor;

  //passing all the data from display item page through the constructor
  TodoItem({Key? key, required this.todo, required this.checkIsItDone, required this.tileColor})
      : super(key: key);

  //Getting all the list item form the class
  final dismissibleKey = Todos.todoList();

  @override
  Widget build(BuildContext context) {
    //Taking the list items and assign them on item variable as a string
    String item = dismissibleKey.toString();

    //Getting the length of the item list
    int index = dismissibleKey.length;
    return ListView(
      shrinkWrap: true,
      children: [
        Dismissible(
          background: Container(color: Colors.indigo),
          key: Key(item),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            dismissibleKey.removeAt(index);
          },
          child: ListTile(
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            //Background color of the tile, will match whatever the color that the user selected
            tileColor: tileColor,
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      //if the task is done we want the line to be stretched else leave it blank
                      decoration: todo.isDone == true ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  Text(
                    todo.desc,
                    style: TextStyle(
                      color: Colors.black,
                      //if the task is done we want the line to be stretched else leave it blank
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
                //using ternary operator to check if is done is true or false and return a right icon
                todo.isDone == true ? Icons.check_box : Icons.check_box_outline_blank,
                color: Colors.green.shade900,
                size: 30.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
