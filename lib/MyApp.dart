import 'package:flutter/material.dart';
import 'package:ogrenci_takip_app/models/Student.dart';
import 'package:ogrenci_takip_app/screens/Student_add.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  Student seciliogrenci = Student(0, "", "", 0);

  List<Student> students = [
    Student(1, "Zeynep", "Yaylacı", 65),
    Student(2, 'Eren', 'Yaylacı', 25),
    Student(3, 'Taha', 'Yaylacı', 65),
    Student(4, 'Halil', 'İbrahim', 45)
  ];

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Öğrenci Takip Sistemi")),
        body: buildBody(context));
  }

  buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(),
              title: Text(students[index].Name + " " + students[index].Surname),
              subtitle: Text("Sınavdan Aldığı Not: " +
                  students[index].Not.toString() +
                  " [" +
                  students[index].getStatus() +
                  "]"),
              trailing: BuildStatusIcon(students[index].Not),
              onTap: () {
                setState(() {
                  seciliogrenci = students[index];
                });
              },
            );
          },
        )),
        Text("Seçili Öğrenci: " +
            seciliogrenci.Name +
            " " +
            seciliogrenci.Surname),
        Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.blueAccent,
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text("Yeni Öğrenci"),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentAdd(students)));
                    })),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.amberAccent,
                    child: Row(
                      children: [
                        Icon(Icons.update),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Güncelle"),
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.redAccent,
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Sil"),
                      ],
                    ),
                    onPressed: () {
                      students.remove(seciliogrenci);
                    }))
          ],
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildStatusIcon(int Not) {
    if (Not >= 50) {
      return Icon(Icons.done);
    } else if (Not >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
