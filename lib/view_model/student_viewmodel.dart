import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/model/student.dart';
import 'package:riverpod_state_management/state/student_state.dart';

final studentViewMoelProvider =
    StateNotifierProvider<StudentViewModel, StudentState>(
  (ref) => StudentViewModel(),
);

class StudentViewModel extends StateNotifier<StudentState> {
  StudentViewModel() : super(StudentState.initialState()) {
    getAllStudents();
  }
  void addStudent(Student student) {
    state = state.copyWith(isLoading: true);
    state.students.add(student);
    state = state.copyWith(isLoading: false);
  }

  void getAllStudents() {
    state = state.copyWith(isLoading: true);
    state.students = [
      Student(fname: 'John', lname: 'Doe', dob: '01/01/2000'),
      Student(fname: 'Jane', lname: 'Doe', dob: '01/01/2000'),
      Student(fname: 'John', lname: 'Smith', dob: '01/01/2000'),
      Student(fname: 'Jane', lname: 'Smith', dob: '01/01/2000'),
    ];
    state = state.copyWith(isLoading: false);
  }
}


