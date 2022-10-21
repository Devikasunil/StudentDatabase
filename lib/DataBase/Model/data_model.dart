// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final String grade;

  StudentModel({
    required this.name,
    required this.id,
    required this.age,
    required this.gender,
    required this.grade,
  });
}
