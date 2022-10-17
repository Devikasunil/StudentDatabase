import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_dattabase/DataBase/Model/data_model.dart';

class StudentDetails extends StatefulWidget {
  StudentDetails({Key? key, required this.data})
      : super(key: key);

  StudentModel data;



  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  XFile? imgXFile;

  final ImagePicker imagePicker = ImagePicker();

  getPicFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgXFile;
    });
  }

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
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    getPicFromGallery();
                  },
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.30,
                    backgroundColor: Colors.grey,
                    backgroundImage: imgXFile == null
                        ? null
                        : FileImage(
                            File(imgXFile!.path),
                          ),
                    child: imgXFile == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.30,
                          )
                        : null,
                  ),
                ),
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
                      'Name :',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      color: Colors.red,
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
                      'Age :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Age',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
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
                      'Gender :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Gender',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
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
                      'Grade :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Grade',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
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
