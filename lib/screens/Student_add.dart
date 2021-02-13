import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_takip_app/models/Student.dart';
import 'package:ogrenci_takip_app/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student> students) {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixing {
  List<Student> students;
  var student = Student.without();
  var formKey = GlobalKey<FormState>();
  _StudentAddState(List<Student> students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(
          20.0,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildNameField(),
              buildSurNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Eren"),
      validator: validateFirstName,
      onSaved: (String value) {
        student.Name = value;
      },
    );
  }

  Widget buildSurNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Soyismi", hintText: "Yaylacı"),
      validator: validateSurName,
      onSaved: (String value) {
        student.Surname = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "100"),
      validator: validateGrade,
      onSaved: (String value) {
        student.Not = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
        color: Colors.blue,
        child: Text("Kaydet"),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            students.add(student);
            Navigator.pop(context);
          }
        });
  }
}
