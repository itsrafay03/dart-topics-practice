import 'art_student.dart';
import 'cs_student.dart';
// This file is to have main function to construct and execute the objects of classes.

void main(List<String> args) {
  // Below we made object of ArtStudnet class and from that object we are able to access the fields and method of Student class, because Student is parent of ArtStudent class.
  // This is simple inheritance like we studied in java. This shows that Dart support Explicit inheritance. Also Implicit inheritance as artStudent accessing members of Object class also.
  ArtStudent artStudent = ArtStudent();
  artStudent.name; // field of Student class.
  artStudent.assignment(); // method of Student class.
  artStudent.toString(); // method of Object class.
  artStudent.hashCode; // property of Object class.
  
  // Below we made object of CsStudnet class and from that object we are able to access the fields and method of Student class, because Student is primary interface of CsStudent class.
  // As Student is implements as primary interface on CsStudent so it is mandatory to give concrete implimentation of each member of Student in CsStudent class. That's we Student members are accessable by CsStudent object. 
  CsStudent csStudent = CsStudent();
  csStudent.name;
  csStudent.assignment();

}
