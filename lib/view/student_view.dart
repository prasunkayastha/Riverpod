import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/model/student.dart';
import 'package:river_pod/view_model/student_view_model.dart';

class StudentView extends ConsumerStatefulWidget {
  const StudentView({super.key});

  @override
  ConsumerState<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends ConsumerState<StudentView> {
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final studentState = ref.watch(StudentViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _fnameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Fname",
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _lnameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter lname",
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Student student = Student(
                    fname: _fnameController.text,
                    lname: _lnameController.text,
                  );
                  ref
                      .read(StudentViewModelProvider.notifier)
                      .addStudent(student);
                },
                child: const Text('Add Student'),
              ),
            ),
            studentState.isLoading
                ? const CircularProgressIndicator()
                : studentState.lstStudents.isEmpty
                    ? const Text('No Data')
                    : Expanded(
                        child: ListView.builder(
                          itemCount: studentState.lstStudents.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title:
                                  Text(studentState.lstStudents[index].fname),
                              subtitle:
                                  Text(studentState.lstStudents[index].lname),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
