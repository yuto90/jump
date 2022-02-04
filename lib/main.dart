import 'package:flutter/material.dart';
import 'mainpage.dart';
import 'top.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Top(),
    );
  }
}
