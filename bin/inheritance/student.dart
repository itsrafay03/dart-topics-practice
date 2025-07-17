// This file is made to understand Inheritance in Dart.

// We made a Student class which act as a parent class for ArtStudent and primary interface for CsStudent class.
class Student {
  // datamembers of class.
  int rollNo;
  String name;
  double fee;
  
  // Optional Named Default Parameterized Constructor. 
  Student({this.rollNo = 0, this.name = 'abc', this.fee = 0.0});
  
  // member function of class. 
  void assignment(){}

}
