// ignore_for_file: file_names, unused_import, must_be_immutable, prefer_const_constructors, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_dattabase/DataBase/Functions/DB_Functions.dart';
import 'package:student_dattabase/DataBase/Model/data_model.dart';
import 'package:student_dattabase/Screens/StudentDetails.dart';

class StudentDetails extends StatelessWidget {
  StudentModel data;
  int index;
  XFile? imgXFile;

  StudentDetails({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 25,
          ),
        ),
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.30,
                  backgroundColor: Colors.grey,
                  // backgroundImage: imgXFile == null
                  //     ? null
                  //     : FileImage(
                  //         File(imgXFile!.path),
                  //       ),
                  // child: imgXFile == null
                  //     ? Icon(
                  //         Icons.add_photo_alternate,
                  //         color: Colors.white,
                  //         size: MediaQuery.of(context).size.width * 0.30,
                  //       )
                  //     : null,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-vector/girl-holding-book-isolated-cartoon-character-elementary-school-student-with-backpack_71593-230.jpg?w=2000'),
                ),
                // ),
                SizedBox(
                  height: 90,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Center Row contents vertically,
                  children: [
                    Text(
                      data.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // Text(
                    //   'Name' ,
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 30,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Center Row contents vertically,
                  children: [
                    Text(
                      data.id,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // Text(
                    //   'Age',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 30,
                    //   ),
                    // ),
                    Divider(
                      thickness: 5,
                      color: Colors.blue,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Center Row contents vertically,
                  children: [
                    Text(
                      data.age,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // Text(
                    //   'Age',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 30,
                    //   ),
                    // ),
                    Divider(
                      thickness: 5,
                      color: Colors.blue,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Center Row contents vertically,
                  children: [
                    Text(
                      data.gender,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // Text(
                    //   'Gender',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 30,
                    //   ),
                    // ),
                    Divider(
                      thickness: 5,
                      color: Colors.blue,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Center Row contents vertically,
                  children: [
                    Text(
                      data.grade,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // Text(
                    //   'Grade',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 30,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
