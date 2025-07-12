import 'named_constructor.dart';

// This file is made to show that package private members of Student class of other file are not accessible in this another mainFile file.

void main(List<String> args) {
  // Student s1 = Student();
  // // Student s2 = Student(2, 'Kamran');
  // Student s3 = Student(rollNo: 12);
  // Student s4 = Student(rollNo: 19, name: 'Ali');
  // Student s5 = Student(name:"Usman", rollNo: 27);
  // print(s4);

  // Simply the Named Optional parameter Constructor of Worker class is called.
  Worker w1 = Worker();
  print(w1);
  Worker w2 = Worker(age: 23);
  print(w2);
  Worker w3 = Worker(name: 'Furqan');
  print(w3);
  Worker w4 = Worker(name: 'Zafar', age: 99);
  print(w4);

  // Now named constructor of Worker class is called.
  // We just call Worker.fromJson and pass the json string in it's parameter. After that call the constructor redirecting start as discussed in named.constructor file.
  Worker w5 = Worker.fromJson('{"rollNo": "R-16", "name": "Imran", "age": 27}');
  print('Named Cons: $w5');

  // Named constructors are useful in dart as they give smart approch instead to write long syntax of code.
  // Another use of named constructors is the constructors of List.
  var list = List.generate(10, (index) => index);
  print('List: $list');
}
