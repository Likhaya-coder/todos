import 'package:flutter/material.dart';
import 'package:to_do_app/classes/todos_data.dart';
import 'package:to_do_app/screens/display_item.dart';

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
          Navigator.pushNamed(context, '/', arguments: {
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
            //const CustomTextField(hintText: 'Enter title here'),
            TextField(
              onChanged: (value) {
                setState(() {
                  print(title = value);
                });
              },
              style: const TextStyle(
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                hintText: 'Enter title here',
                hintStyle: const TextStyle(
                  color: Colors.blueGrey,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0),
            //const CustomTextField(hintText: 'Describe what you like to do'),
            TextField(
              onChanged: (value) {
                setState(() {
                  print(desc = value);
                });
              },
              style: const TextStyle(
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                hintText: 'Describe what you like to do',
                hintStyle: const TextStyle(
                  color: Colors.blueGrey,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            const Text(
              'Priority:',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: 600.0,
              height: 58.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: kFloatingButtonColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  style: kDropdownTextStyle,
                  dropdownColor: kDropdownBackgroundColor,
                  iconEnabledColor: kDropdownBackgroundColor,
                  iconSize: 40.0,
                  value: severity,
                  items: getDropDownItems(),
                  onChanged: (value) {
                    setState(
                      () {
                        print(severity = value.toString());
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
