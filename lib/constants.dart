import 'package:flutter/material.dart';

const kScaffoldNavy = Color(0xFF0A1234);
const kAppBarNavy = Color(0xFF141A3C);
const kFloatingButtonColor =  Color(0xFFFFFFFF);

const kDropdownTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
);
const kDropdownBackgroundColor = Colors.blueGrey;

final kDescriptionInputDecoration = InputDecoration(
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
);

final kTitleInputDecoration = InputDecoration(
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
);