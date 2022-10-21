// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_dattabase/Screens/HomePage.dart';

import 'DataBase/Model/data_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(
  //   StudentModelAdapter(),
  // );
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  // await Hive.openBox<StudentModel>('Student_db');
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
