// This file is made to understand the record type in dart.
// A Record is an anonymous(with no name of type), aggregate(make by collection of different type of objects), immutable(can't change their fields values after creation), algebaric(support algebaric datatypes).
// Like other collection types, they let you bundle multiple objects into a single object. Unlike other collection types, records are fixed-sized, heterogeneous, and typed.
// Records are real values; you can store them in variables, nest them, pass them to and from functions, and store them in data structures such as lists, maps, and sets.
// Like class, mixin, or enum the record is also a type in Dart. Record type is anonymous as it has no keyword to define it's type. 
// (int, String, num, bool) is the typedef of Record. It tells us that record is composit of which types, typedefs are in which order and which quantity. Donot call them parameters.  
// https://dart.dev/language/records  consult this as sir implement record from offical documentation.

// main function.
void main(List<String> args) {
  // Below are records as these types are forming by composition of multiple datatypes.
  (int, String) record1;   // record1 is a variable name.
  // print(record1);   // Error because we need to initilize record before accessing it.

  // As we record2 is nullable so that's why we do not get error here.
  (int, String)? record2;
  print('Record2: $record2');

  (int, bool, String) record3;
  // Below there is error because order of values do not match with the order of typedefs of record as defined.
  // record3 = (99, 'Aslam', false);
  record3 = (10, true, 'Imran');
  print('Runtype of Record3: ${record3.runtimeType}');
  print('Record3: $record3');

  // swap function is called.
  print(swap(('Waqar Zaka', 22)));
  (String, int) record4 = ('', 10);
  swap(record4);


}

// If we want to return multiple type of values from function so we can use record as RDT. In actual only single type value is returning from function which is record. But record is composit type.
(num, String) foo(){
  return (20, 'Ali');
}
//or
(int, String) soo(String name, int age){
  return (age, name);
}

// swap functions which return record and take record in parameter.
(int, String) swap((String, int) rec){
  var (a, b) = rec;  
  return (b, a);
  // pattern matching and destructuring concept applied here which we will discuss below.
}