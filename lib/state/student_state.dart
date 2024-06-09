import 'package:river_pod/model/student.dart';

class StudentState {
  final List<Student> lstStudents;
  final bool isLoading;

  StudentState({
    required this.lstStudents,
    required this.isLoading,
  });

  factory StudentState.initial() {
    return StudentState(lstStudents: [], isLoading: false);
  }
  // copy with
  StudentState copyWith({Student? student, bool? isLoading}) {
    return StudentState(
        lstStudents: student != null ? [...lstStudents, student] : lstStudents,
        isLoading: isLoading ?? this.isLoading);
  }
}
