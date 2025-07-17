import 'student.dart';
// This file has a CsStudent class. In Dart every class is also a primary interface. So we donot need to make secondary interfaces like in Java.
// Dart gives us facility that we can extend the class as well as implement the same class. As done with Student class. 
// As here we implements the Student class on CsStudent class, means we implements primary interface of Student class on CsStudent class.
// For interface it is mandatory that class must overrides all the members of interface because when you implement a class in Dart, you're saying:
// "I promise to provide concrete definitions for everything this interface (class) declares.". So that's why we have to override every member of Student class in CsStudent.
// In Dart as class is the primary interface so we can implements as well as extend the class.

class CsStudent implements Student{
  @override
  double fee;

  @override
  String name;

  @override
  int rollNo;

  @override
  void assignment() {
    
  }

  // Constructor of CsStudent class.
  CsStudent({this.rollNo = 0, this.name = 'abc', this.fee = 0.0});
  
}
