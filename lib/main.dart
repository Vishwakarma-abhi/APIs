import 'package:api/example_two.dart';
import 'package:api/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:api/example_three.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const exsmple_3(),
    );
  }
}
