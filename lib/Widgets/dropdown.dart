import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';

class Dropdown extends StatefulWidget {
  late String severity;
  final List<DropdownMenuItem<String>> getDropDownItems;
  Dropdown({Key? key, required this.severity, required this.getDropDownItems}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          value: widget.severity,
          items: widget.getDropDownItems,
          onChanged: (value) {
            setState(
                  () {
                print(widget.severity = value.toString());
              },
            );
          },
        ),
      ),
    );
  }
}
