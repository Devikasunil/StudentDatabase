// ignore_for_file: file_names, unused_import, must_be_immutable, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_dattabase/DataBase/Functions/DB_Functions.dart';
import 'package:student_dattabase/Screens/StudentDetails.dart';
import 'package:student_dattabase/WIdgets/TextFormField_Widget.dart';
import 'package:student_dattabase/Screens/SearchScreen.dart';
import 'package:student_dattabase/DataBase/Model/data_model.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);
  XFile? imgXFile;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: TextField(
          controller: _search,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ValueListenableBuilder(
              valueListenable: studentlistNotifier,
              builder: (BuildContext ctx, List<StudentModel> studentList,
                  Widget? child) {
                var search = _search.text.isEmpty
                    ? studentList
                    : studentList
                        .where(
                          (element) => element.name.toLowerCase().contains(
                                _search.text.toLowerCase(),
                              ),
                        )
                        .toList();
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: ListView.separated(
                    itemBuilder: (ctx, index) {
                      final data = search[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StudentDetails(data: data, index: index),
                                ),
                              );
                            },
                            title: Text(data.name),
                            subtitle: Text('ID' + data.id),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return Divider(
                        height: 5,
                        color: Colors.black,
                      );
                    },
                    itemCount: search.length,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
