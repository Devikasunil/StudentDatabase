import 'package:flutter/material.dart';
import 'package:student_dattabase/WIdgets/ListVIew_Widget.dart';
import 'package:student_dattabase/WIdgets/TextFormField_Widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchOption(),
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
      body: Column(
        children: [
          TextFromField_Widget(),
          Expanded(
            child: ListView_Widget(),
          ),
        ],
      ),
    );
  }
}

class SearchOption extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      onPressed: () {
        query == null ? close(context, null) : query = '';
      },
      icon: Icon(
        Icons.clear,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
