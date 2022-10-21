// ignore_for_file: file_names, unused_import, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:student_dattabase/DataBase/Functions/DB_Functions.dart';
import 'package:student_dattabase/Screens/ListPage.dart';
import 'package:student_dattabase/Screens/SearchScreen.dart';
import 'package:student_dattabase/WIdgets/ListVIew_Widget.dart';
import 'package:student_dattabase/WIdgets/TextFormField_Widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFromField_Widget(),
                // Expanded(
                //   child: ListPage(),
                // ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ListPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Show Students',
                    style: TextStyle(
                      color: Colors.grey[100],
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
        ),
      ),
    );
  }
}

// class SearchOption extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     IconButton(
//       onPressed: () {
//         query == null ? close(context, null) : query = '';
//       },
//       icon: Icon(
//         Icons.clear,
//         color: Colors.black,
//       ),
//     );
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     IconButton(
//       onPressed: () {},
//       icon: Icon(
//         Icons.arrow_back,
//         color: Colors.black,
//       ),
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     throw UnimplementedError();
//   }
// }
