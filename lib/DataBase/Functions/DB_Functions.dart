// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:student_dattabase/DataBase/Model/data_model.dart';

ValueNotifier<List<StudentModel>> studentlistNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.add(value);
  // final _no =await
  // value.no = _no;
  studentlistNotifier.value.add(value);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  studentlistNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentlistNotifier.value.clear();
  studentlistNotifier.value.addAll(studentDB.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  studentlistNotifier.notifyListeners();
}

Future<void> deleteStudent(index) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.deleteAt(index);
  getAllStudents();
}

Future<void> editStudent(index, value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.putAt(index, value);
  getAllStudents();
}
