// This file is made to understand the concept of Properties in Dart.
// Properties are special member functions of a class in dart. 
// They are sprecial because they are member functions of a class but behave/work like a datamember of a class.
 
class Student {
  // Private datamember of a class, so we have to make it's getter-setters(Properties) to give it's access outside the file.
  int _rollNo = 0;

  // This is getter.
  int get rollNo => _rollNo;
  // this is setter. It's rdt is void so use dynamic approch and no need to write void.
  set rollNo(int value){
    if(value > 0){  // The abstraction of _rollNo is to be greater then 0
      _rollNo = value;
    }else{
      // The below line will throw exception as constructor of Exception() is called here with the error message shown in the exception.
      throw Exception('$value is Invalid value. It must be greater then 0');
    }
  }

  // This is a NOT a fixed rule of Property that getter and setter must have same names. We can use same or differet names.
  // If property is simply to get and set the value of private datamember then we can put their same name. 
  // Using get/set keywords tells Dart that you're creating a property, not a regular method.  So it allow these functions to use as datamembers.
  // The answer of the question that how they can be distingushed getter and setter when called with same name, is in the main.dart file, so check it there. 

  
}