import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_takip_app/models/Student.dart';
import 'package:ogrenci_takip_app/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student selectedstudent;
  StudentEdit(Student selectedstudent) {
    this.selectedstudent = selectedstudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedstudent);
  }
}

class _StudentEditState extends State with StudentValidationMixing {
  Student selectedstudent;
  var formKey = GlobalKey<FormState>();
  _StudentEditState(Student selectedstudent) {
    this.selectedstudent = selectedstudent;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci güncelle"),
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
      decoration: InputDecoration(
          labelText: "Öğrenci Adı", hintText: selectedstudent.Name),
      validator: validateFirstName,
      onSaved: (String value) {
        selectedstudent.Name = value;
      },
    );
  }

  Widget buildSurNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci Soyismi", hintText: selectedstudent.Surname),
      validator: validateSurName,
      onSaved: (String value) {
        selectedstudent.Surname = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Aldığı Not", hintText: selectedstudent.Not.toString()),
      validator: validateGrade,
      onSaved: (String value) {
        selectedstudent.Not = int.parse(value);
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
            Navigator.pop(context);
          }
        });
  }
}
