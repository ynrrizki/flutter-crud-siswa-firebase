import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_siswa_firebase/models/student.dart';

final CollectionReference studentCollection =
    FirebaseFirestore.instance.collection("students");

class StudentService {
  static Future<void> create(Student student) async {
    // firebase code
    // await studentCollection.add(student.toJson());

    // without firebase
    Student.students.add(
      Student(
        name: student.name,
        age: student.age,
        impian: student.impian,
      ),
    );
  }

  static Future<void> update(dynamic uid, Student student) async {
    // firebase code
    await studentCollection.doc(uid).update(student.toJson());
  }

  static Stream<List<Student>> getAll() {
    return studentCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((docs) =>
              Student.fromJson(docs as DocumentSnapshot<Map<String, dynamic>>))
          .toList();
    });
  }

  static Future<void> destroy(dynamic uid) async {
    // firebase code
    await studentCollection.doc(uid).delete();
  }
}
