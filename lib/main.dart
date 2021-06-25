import 'package:dump/screens/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DUMP',
        theme: ThemeData(primaryColor: Color.fromRGBO(48, 72, 75, 1)),
        home: HomePage());
  }
}
