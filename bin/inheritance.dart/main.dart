import 'art_student.dart';
// This file is to have main function to construct and execute the objects of classes.

void main(List<String> args) {
  // Below we made object of ArtStudnet class and from that object we are able to access the fields and method of Student class, because Student is parent of ArtStudent class.
  // This is simple inheritance like we studied in java.
  ArtStudent artStudent = ArtStudent();
  artStudent.name;
  artStudent.assignment();
  


} 