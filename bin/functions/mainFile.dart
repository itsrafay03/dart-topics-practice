import 'class_and_constructor.dart';
import 'named_constructor.dart';

// This file is made to show that package private members of Student class of other file are not accessible in this another mainFile file.

void main(List<String> args) {
  // Student s1 = Student();
  // // Student s2 = Student(2, 'Kamran');
  // Student s3 = Student(rollNo: 12);
  // Student s4 = Student(rollNo: 19, name: 'Ali');
  // Student s5 = Student(name:"Usman", rollNo: 27);
  // print(s4);

  Worker w1 = Worker(age: 2,);
  print(w1);
}
