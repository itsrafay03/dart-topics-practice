// This Student class is made to understand the concept of Properties in Dart.
// Properties are special member functions of a class in dart. 
// They are sprecial because they are member functions of a class but behave/work like a datamember of a class.
 
class Student {
  // Private datamember of a class, so we have to make it's getter-setters(Properties) to give it's access outside the file.
  int _rollNo = 0;

  // This is getter.
  int get rollNo => _rollNo;
  // this is setter.
  set rollNo(int value){
    if(value > 0){
      _rollNo = value;
    }else{
      throw Exception('$value is Invalid value. It must be greater then 0');
    }
  }
  
}