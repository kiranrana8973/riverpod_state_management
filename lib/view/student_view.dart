import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/model/student.dart';
import 'package:riverpod_state_management/view_model/student_viewmodel.dart';

class StudentView extends ConsumerStatefulWidget {
  const StudentView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentViewState();
}

class _StudentViewState extends ConsumerState<StudentView> {
  final firstNameController = TextEditingController(text: 'Kiran');
  final lastNameController = TextEditingController(text: 'Rana');
  final dobController = TextEditingController(text: '12-12-2020');
  final gap = const SizedBox(height: 8);
  @override
  Widget build(BuildContext context) {
    // Watch the ViewModel
    final data = ref.watch(studentViewMoelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: Column(
        children: [
          gap,
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'First Name',
              border: OutlineInputBorder(),
            ),
            controller: firstNameController,
          ),
          gap,
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Last Name',
              border: OutlineInputBorder(),
            ),
            controller: lastNameController,
          ),
          gap,
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Dob',
              border: OutlineInputBorder(),
            ),
            controller: dobController,
          ),
          gap,
          ElevatedButton(
            onPressed: () {
              var student = Student(
                fname: firstNameController.text,
                lname: lastNameController.text,
                dob: dobController.text,
              );

              ref.read(studentViewMoelProvider.notifier).addStudent(student);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Student Added Successfully'),
                  duration: Duration(seconds: 1),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Add'),
          ),
          data.students.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: data.students.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data.students[index].fname!),
                        subtitle: Text(data.students[index].lname!),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      );
                    },
                  ),
                )
              : const Text('Data chaina')
        ],
      ),
    );
  }
}
