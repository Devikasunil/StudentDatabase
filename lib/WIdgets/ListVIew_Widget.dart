import 'dart:io';

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
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Builder(
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable: studentListNotifier,
            builder: (BuildContext ctx, List<StudentModel> studentList,
                Widget? child) {
              return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = studentList[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx){
                            return StudentDetails( data:data);
                          }
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    title: Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    subtitle: Text(
                      'Grade',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                    tileColor: Colors.white,
                    // onLongPress: ,
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider(
                    thickness: 10,
                    color: Colors.grey[300],
                  );
                },
                itemCount: studentList.length,
              );
            },
          );
        },
      ),
    );
  }
}
