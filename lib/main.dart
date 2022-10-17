import 'package:flutter/material.dart';
import 'package:student_dattabase/Screens/HomePage.dart';

void main() {
  runApp(
    StudentDatabase(),
  );
}

class StudentDatabase extends StatelessWidget {
  const StudentDatabase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Database',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.red,
      ),
      home: HomePage(),
    );
  }
}
