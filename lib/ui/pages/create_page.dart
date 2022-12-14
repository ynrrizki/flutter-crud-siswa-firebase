import 'package:crud_siswa_firebase/models/student.dart';
import 'package:crud_siswa_firebase/services/student_service.dart';
import 'package:crud_siswa_firebase/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController impianController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: const Text('Create Data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              children: [
                TextFieldWidget(
                  label: 'Name',
                  controller: nameController,
                ),
                const SizedBox(height: 40),
                TextFieldWidget(
                  label: 'Age',
                  controller: ageController,
                ),
                const SizedBox(height: 40),
                TextFieldWidget(
                  label: 'Impian',
                  controller: impianController,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    nameController.text;
                    ageController.text;
                    impianController.text;
                    // firebase code
                    // StudentService.create(
                    //   Student(
                    //     name: nameController.text,
                    //     age: int.parse(ageController.text),
                    //     impian: impianController.text,
                    //   ),
                    // );

                    // without firebase code
                    StudentService.create(
                      Student(
                        uid: DateTime.now().millisecondsSinceEpoch,
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        impian: impianController.text,
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 0),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
