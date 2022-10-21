// ignore_for_file: unused_import, file_names, use_key_in_widget_constructors, camel_case_types, unused_field, override_on_non_overriding_member, prefer_const_constructors, body_might_complete_normally_nullable, sort_child_properties_last, avoid_print

import 'dart:io';
import 'dart:developer';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_dattabase/DataBase/Functions/DB_Functions.dart';
import 'package:student_dattabase/DataBase/Model/data_model.dart';

class TextFromField_Widget extends StatefulWidget {
  TextFromField_Widget({Key? key}) : super(key: key);

  @override
  State<TextFromField_Widget> createState() => _TextFromField_WidgetState();
}

class _TextFromField_WidgetState extends State<TextFromField_Widget> {
  final _nameController = TextEditingController();

  final _idController = TextEditingController();

  final _ageController = TextEditingController();

  final _genderController = TextEditingController();

  final _gradeController = TextEditingController();

  // @override
  // void dispose() {
  //   Hive.close();
  //   Hive.box('Student_db').close();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // image != null
                    //     ? ClipOval(
                    //         child: Image.file(
                    //           image!,
                    //           width: 100,
                    //           height: 100,
                    //           fit: BoxFit.fill,
                    //         ),
                    //       )
                    //     : ClipOval(
                    //         child: Icon(
                    //           Icons.add_a_photo_outlined,
                    //         ),
                    //       )
                    // GestureDetector(
                    //   onTap: () => getPicFromGallery(),
                    // ),
                    // CircleAvatar(
                    //   radius: MediaQuery
                    //       .of(context)
                    //       .size
                    //       .width * 0.10,
                    //   backgroundColor: Colors.grey,
                    //   backgroundImage: imgXFile == null
                    //       ? null
                    //       : FileImage(
                    //     File(imgXFile!.path),
                    //   ),
                    //   child: imgXFile == null ? Icon(
                    //     Icons.add_a_photo_outlined,): null,
                    // ),
                    ClipOval(
                      child: Image(
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiAJlCBM4672o0a-7WQMZy2OgARFm1RTPJnA&usqp=CAU',
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
                hintStyle: TextStyle(
                  color: Colors.blue[900],
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Name';
                }
              },
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _idController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ID',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter ID Number';
                }
              },
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: _ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Age';
                }
              },
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _genderController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Gender',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Gender';
                }
              },
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _gradeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Grade',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Grade';
                }
              },
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      onAddStudentClicked();
                    },
                    child: Text(
                      'Add Student',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[900],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      clearDetails();
                    },
                    child: Text(
                      'Clear Student',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[900],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddStudentClicked() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final id = _idController.text.trim();
    final gender = _genderController.text.trim();
    final grade = _gradeController.text.trim();

    if (name.isEmpty ||
        id.isEmpty ||
        age.isEmpty ||
        gender.isEmpty ||
        grade.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Enter a valid entry'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Data Saved!',
          ),
        ),
      );
      final student = StudentModel(
        name: name,
        id: id,
        age: age,
        gender: gender,
        grade: grade,
      );
      addStudent(student);
      _nameController.clear();
      _ageController.clear();
      _gradeController.clear();
      _genderController.clear();
      _idController.clear();
    }
  }

  clearDetails() {
    _nameController.text = '';
    _idController.text = '';
    _ageController.text = '';
    _genderController.text = '';
    _gradeController.text = '';
  }

  // File? image;
  //
  // Future pickimagecamera() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (image == null) return;
  //   final imageTemporary = File(image.path);
  //   this.image = imageTemporary;
  //   setState(() {
  //     this.image = imageTemporary;
  //   });
  // }
  //
  // Future pickimagegallery() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) return;
  //   final imageTemporary = File(image.path);
  //   this.image = imageTemporary;
  //   setState(() {
  //     this.image = imageTemporary;
  //   });
  // }
  XFile? imgXFile;
  final ImagePicker imagePicker = ImagePicker();

  getPicFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgXFile;
    });
  }
}
