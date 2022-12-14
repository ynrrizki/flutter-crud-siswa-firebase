import 'package:crud_siswa_firebase/models/student.dart';
import 'package:crud_siswa_firebase/services/student_service.dart';
import 'package:crud_siswa_firebase/ui/pages/edit_page.dart';
import 'package:crud_siswa_firebase/ui/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowPage extends StatelessWidget {
  final Student student;
  const ShowPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read One Data'),
        centerTitle: true,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(student: student),
                ),
              );
            },
            child: const Icon(Icons.edit),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              // firebase code
              // StudentService.destroy(student.uid);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false,
              );
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: ListTile(
                leading: const Icon(CupertinoIcons.profile_circled, size: 50),
                title: Text(student.name!),
                subtitle: Text(
                    'Aku ${student.impian}, masih berumur ${student.age} tahun'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
