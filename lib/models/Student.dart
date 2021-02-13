class Student {
  int Id;
  String Name;
  String Surname;
  int Not;
  String _status = "";

  // ignore: empty_constructor_bodies
  Student(int Id, String Name, String Surname, int Not) {
    this.Id = Id;
    this.Name = Name;
    this.Surname = Surname;
    this.Not = Not;
  }
  // ignore: empty_constructor_bodies
  Student.without() {}

  String getStatus() {
    if (Not >= 50) {
      return _status = "Geçti";
    } else if (Not >= 40) {
      return _status = "Bütünleme";
    } else {
      return _status = "Kaldı";
    }
  }
}
