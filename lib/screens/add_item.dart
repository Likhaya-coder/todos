import 'package:flutter/material.dart';
import 'package:to_do_app/classes/todos_data.dart';
import '../Widgets/dropdown.dart';
import '../constants.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String severity = 'red';
  late String title;
  late String desc;

  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String priorities in priority) {
      var item = DropdownMenuItem(
        value: priorities,
        child: Text(priorities),
      );
      dropDownItems.add(item);
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, {
            'title': title,
            'description': desc,
            'color': severity,
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Add Item'),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter title:',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0),

            TextField(
              onChanged: (value) {
                setState(() {
                  print(title = value);
                });
              },
              style: const TextStyle(
                color: Colors.black54,
              ),
              decoration: kTitleInputDecoration,
            ),
            const SizedBox(height: 25.0),

            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0),

            TextField(
              onChanged: (value) {
                setState(() {
                  print(desc = value);
                });
              },
              style: const TextStyle(
                color: Colors.black54,
              ),
              decoration: kDescriptionInputDecoration,
            ),
            const SizedBox(height: 25.0),

            const Text(
              'Priority:',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0),

            Dropdown(
              severity: severity,
              getDropDownItems: getDropDownItems(),
            ),
          ],
        ),
      ),
    );
  }
}
