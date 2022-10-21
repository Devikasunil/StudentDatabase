// ignore_for_file: file_names, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_dattabase/DataBase/Functions/DB_Functions.dart';
import 'package:student_dattabase/WIdgets/ListVIew_Widget.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of Students',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        toolbarHeight: 90,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView_Widget(),
          ),
        ],
      ),
    );
  }
}
