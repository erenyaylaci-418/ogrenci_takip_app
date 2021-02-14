class Student {
  int Id;
  String Name;
  String Surname;
  int Not;
  String _status = "";

  Student(int Id, String Name, String Surname, int Not) {
    this.Id = Id;
    this.Name = Name;
    this.Surname = Surname;
    this.Not = Not;
  }

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
