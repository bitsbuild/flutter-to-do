import 'package:flutter/material.dart';
import 'package:todo/to_do_scaffold.dart';

void main() {
  runApp(ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoScaffold(),
      debugShowCheckedModeBanner: false,
      title: 'To Do',
    );
  }
}
