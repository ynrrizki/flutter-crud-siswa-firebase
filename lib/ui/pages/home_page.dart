import 'package:crud_siswa_firebase/models/student.dart';
import 'package:crud_siswa_firebase/services/student_service.dart';
import 'package:crud_siswa_firebase/ui/pages/create_page.dart';
import 'package:crud_siswa_firebase/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read All Data'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          // redirect to create_page.dart
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      // body: StreamBuilder(
      //   stream: StudentService.getAll(),
      //   builder: (context, snapshot) {
      //     final student = snapshot.data;
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //         padding: const EdgeInsets.all(30),
      //         itemCount: student!.length,
      //         itemBuilder: (context, index) {
      //           return StudentCardWidget(student: student[index]);
      //         },
      //       );
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
      // without firebase
      body: ListView.builder(
        padding: const EdgeInsets.all(30),
        itemCount: Student.students.length,
        itemBuilder: (context, index) {
          return StudentCardWidget(student: Student.students[index]);
        },
      ),
    );
  }
}
