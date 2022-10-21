// ignore_for_file: file_names, unused_import, unnecessary_import, camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_dattabase/DataBase/Functions/DB_Functions.dart';
import 'package:student_dattabase/Screens/StudentDetails.dart';

import '../DataBase/Model/data_model.dart';

class ListView_Widget extends StatefulWidget {
  ListView_Widget({Key? key}) : super(key: key);

  @override
  State<ListView_Widget> createState() => _ListView_WidgetState();
}

class _ListView_WidgetState extends State<ListView_Widget> {
  XFile? imgXFile;

  final _updateName = TextEditingController();

  final _updateId = TextEditingController();

  final _updateAge = TextEditingController();

  final _updateGender = TextEditingController();

  final _updateGrade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentlistNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return Card(
          color: Colors.white,
          child: Builder(
            builder: (context) {
              return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = studentList[index];
                  return ListTile(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (ctx) {
                      //     return StudentDetails(
                      //       data: data,
                      //       index: index,
                      //     );
                      //   }),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentDetails(
                            data: data,
                            index: index,
                          ),
                        ),
                      );
                    },
                    leading: Column(
                      children: [
                        // GestureDetector(
                        //   onTap: () => getPicFromGallery(),
                        // ),
                        // CircleAvatar(
                        //   radius: MediaQuery.of(context).size.width * 0.30,
                        //   backgroundColor: Colors.grey,
                        //   backgroundImage: imgXFile == null
                        //       ? null
                        //       : FileImage(
                        //           File(imgXFile!.path),
                        //         ),
                        //   child: imgXFile == null
                        //       ? Icon(
                        //           Icons.add_photo_alternate,
                        //           color: Colors.white,
                        //           size:
                        //               MediaQuery.of(context).size.width * 0.30,
                        //         )
                        //       : null,
                        // ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://img.freepik.com/premium-vector/girl-holding-book-isolated-cartoon-character-elementary-school-student-with-backpack_71593-230.jpg?w=2000',
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      data.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    subtitle: Text(
                      data.grade,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => SimpleDialog(
                                elevation: 10,
                                backgroundColor: Colors.white,
                                title: Text('Update Details'),
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 4,
                                        bottom: 4,
                                        right: 8,
                                        left: 8,
                                      ),
                                      child: Container(
                                        child: TextFormField(
                                          controller: _updateName
                                            ..text = data.name,
                                          autocorrect: false,
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            hintText: 'Name',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 4,
                                      bottom: 4,
                                      right: 8,
                                      left: 8,
                                    ),
                                    child: TextFormField(
                                      controller: _updateId..text = data.id,
                                      autocorrect: false,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 4,
                                      bottom: 4,
                                      right: 8,
                                      left: 8,
                                    ),
                                    child: TextFormField(
                                      controller: _updateAge..text = data.age,
                                      autocorrect: false,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 4,
                                      bottom: 4,
                                      right: 8,
                                      left: 8,
                                    ),
                                    child: TextFormField(
                                      controller: _updateGender
                                        ..text = data.gender,
                                      autocorrect: false,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 4,
                                      bottom: 4,
                                      right: 8,
                                      left: 8,
                                    ),
                                    child: TextFormField(
                                      controller: _updateGrade
                                        ..text = data.grade,
                                      autocorrect: false,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 100,
                                      right: 100,
                                      top: 8,
                                      bottom: 8,
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        openpopup(index);
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Text(
                                        'Update',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text('DELETE'),
                                content:
                                    Text('Are you sure you want to delete?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      deleteStudent(index);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.delete,
                          ),
                          color: Colors.black,
                        ),
                      ],
                    ),
                    tileColor: Colors.grey[100],
                    // onLongPress: ,
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider(
                    thickness: 10,
                    color: Colors.blue[900],
                  );
                },
                itemCount: studentList.length,
              );
            },
          ),
        );
      },
    );
  }

  void openpopup(index) {
    final name = _updateName.text.trim();

    final id = _updateId.text.trim();
    final age = _updateAge.text.trim();
    final gender = _updateGender.text.trim();
    final grade = _updateGrade.text.trim();
    if (name.isEmpty ||
        age.isEmpty ||
        gender.isEmpty ||
        id.isEmpty ||
        grade.isEmpty) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                backgroundColor: Color.fromARGB(213, 190, 186, 240),
                title: const Text('ERROR'),
                content: const Text('Fields cannot be empty!'),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ));
    } else {
      Navigator.pop(context);
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                backgroundColor: Colors.white,
                title: const Text('SUCCESS'),
                content: const Text('Data has been updated'),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.black),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ));
      final upStudent = StudentModel(
        name: name,
        id: id,
        age: age,
        gender: gender,
        grade: grade,
      );
      editStudent(index, upStudent);
      _updateGrade.clear();
      _updateGender.clear();
      _updateAge.clear();
      _updateName.clear();
      _updateId.clear();
    }
  }

// final ImagePicker imagePicker = ImagePicker();
//
// getPicFromGallery() async {
//   imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
//   setState(() {
//     imgXFile;
//   });
//
// }
}
