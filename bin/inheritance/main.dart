import 'art_student.dart';
// This file is to have main function to construct and execute the objects of classes.

void main(List<String> args) {
  // Below we made object of ArtStudnet class and from that object we are able to access the fields and method of Student class, because Student is parent of ArtStudent class.
  // This is simple inheritance like we studied in java. This shows that Dart support Explicit inheritance. Also Implicit inheritance as artStudent accessing members of Onject class also.
  ArtStudent artStudent = ArtStudent();
  artStudent.name; // field of Student class.
  artStudent.assignment(); // method of Student class.
  artStudent.toString(); // method of Object class.
  artStudent.hashCode; // property of Object class.

print(00);
print(9876543);


}
