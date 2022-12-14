import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  dynamic uid;
  String? name;
  int? age;
  String? impian;

  Student({this.uid, this.name, this.age, this.impian});

  factory Student.fromJson(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final json = snapshot;
    return Student(
      uid: json.id,
      name: json['name'],
      age: json['age'],
      impian: json['impian'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "impian": impian,
      };

  static List<Student> students = [
    Student(uid: 1, name: 'Yanto', age: 17, impian: 'Front End Developer'),
    Student(uid: 2, name: 'Dinda', age: 20, impian: 'Devops Engineer'),
    Student(uid: 3, name: 'Bimo', age: 17, impian: 'Back End Developer'),
  ];
}
