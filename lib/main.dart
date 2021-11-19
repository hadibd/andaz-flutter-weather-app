import 'package:andaz/widget/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AndazApp());
}

class AndazApp extends StatefulWidget {
  const AndazApp({Key? key}) : super(key: key);

  @override
  _AndazAppState createState() => _AndazAppState();
}

class _AndazAppState extends State<AndazApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomePage(),
    );
  }
}
