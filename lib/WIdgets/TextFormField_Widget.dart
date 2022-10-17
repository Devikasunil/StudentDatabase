import 'package:flutter/material.dart';
import 'package:student_dattabase/DataBase/Functions/DB_Functions.dart';
import 'package:student_dattabase/DataBase/Model/data_model.dart';

class TextFromField_Widget extends StatelessWidget {
  TextFromField_Widget({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _gradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Age',
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _genderController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Gender',
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _gradeController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Grade',
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
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
                Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> onAddStudentClicked()async{
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _gender = _genderController.text.trim();
    final _grade = _gradeController.text.trim();

    if (_name.isEmpty || _age.isEmpty || _gender.isEmpty || _grade.isEmpty){
      return;
    }
    print('$_name $_age');

    final _student = StudentModel(name: _name, age: _age, gender: _gender, grade: _grade);
    addStudent(_student);
  }
}
