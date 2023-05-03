import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/screens/display_item.dart';
import 'package:to_do_app/screens/add_item.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kFloatingButtonColor,
      ),
      scaffoldBackgroundColor: kScaffoldNavy,
      appBarTheme: const AppBarTheme(color: kAppBarNavy)
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const DisplayItem(),
      '/addItem': (context) => const AddItem(),
    },
  ));
}

