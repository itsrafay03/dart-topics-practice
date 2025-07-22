// This file is made to understand the record type in dart.
// A Record is an anonymous(with no name of type), aggregate(make by collection of different type of objects), immutable(can't change their fields values after creation), algebaric(support algebaric datatypes).
// Like other collection types, they let you bundle multiple objects into a single object. Unlike other collection types, records are fixed-sized, heterogeneous, and typed.
// Records are real values; you can store them in variables, nest them, pass them to and from functions, and store them in data structures such as lists, maps, and sets.
// Like class, mixin, or enum the record is also a type in Dart. Record type is anonymous as it has no keyword to define it's type. 
// (int, String, num, bool) is the typedef of Record. It tells us that record is composit of which types, typedefs are in which order and which quantity. Donot call them parameters they are fields of record type.  
// https://dart.dev/language/records  consult this as sir implement record from offical documentation.

// main function.
void main(List<String> args) {
  // Part 1: Different types of records.
  // Below are records as these types are forming by composition of multiple datatypes.
  (int, String) record1;   // record1 is a variable name.
  // print(record1);   // Error because we need to initilize record before accessing it.

  // As we record2 is nullable so that's why we do not get error here.
  (int, String)? record2;
  print('Record2: $record2');

  (int intigerValue, bool booleanValue, String stringValue) record3;
  // Below there is error because order of values do not match with the order of typedefs of record as defined.
  // record3 = (99, 'Aslam', false);
  record3 = (10, true, 'Imran');
  print('Runtype of Record3: ${record3.runtimeType}');
  print('Record3: $record3');

  // Another complex record.
  ((Map<String, dynamic>, bool),(String, num), List<String>) record4 = (({'World': 2}, true), ('WWE', 99.9), ['Pakistan', 'England', 'Chaina']);
  print('Record4: $record4');
  print('Runtype of Record4: ${record4.runtimeType}');

  // Part 2: Named and positional fields of record and how to access them.
  // Records expressions are comma-delimited lists of named Or positional fields, enclosed in parentheses.
  // Record fields are accessible through built-in getters. Records are immutable, so fields do not have setters. Named fields expose getters of the same name. Positional fields expose getters of the name $<position>, skipping named fields.
  // In above records all are positional parameters. So when we give value to record the position of values will remain same as the position of record types.
  // We can access the positional fields of record by 
  (int, String, num) std;
  // std = (12, 24.5, 'Awais');   // Show error as position of fields and their values do not match.
  std = (12, 'Salman', 24.5);   // Now correct
  // Positional fields of record are accessible by $position of field.
  print('1st parameter ${std.$1} 2nd parameter ${std.$2}');
  var a = std.$3;
  print(a);

  // Then we will see that record fields can be named. For that we have same previous rule of {}. 
  // Now we can give values to record in any position of their fields because now they are not positional, they are named fields and access by their names.
  ({int rollNo, String name, double fee}) stdRecord = (name: 'Aqib', rollNo: 11, fee: 1500.5);
  // Named fields of record are accessible by their names of field.
  print('Name: ${stdRecord.name}, fee: ${stdRecord.fee}, rollNo: ${stdRecord.rollNo}');
  print(stdRecord.name);

  // type inference of record.
  var record = ('first', a: 17, b: 25.5, 'last', true);
  print(record.$1); 
  print(record.$2); 
  print(record.$3); 
  print(record.a); 
  print(record.b); 
  // We can not modify the values of record because it is immutable. So we have no setters for the fields of record.
  // record.$1 = 'Ali';   // Error that setter is not defined.
  // record.a = 20;      // Error that setter is not defined.
  
  // Part 3: Relation of records.
  // The names of named fields in a record type are part of the record's type definition, or its shape. Two records of same signature with named fields with different names have different types.
  ({int a, int b}) recordA = (a: 1, b: 2);
  ({int x, int y}) recordX = (x: 3, y: 4);
  // recordA = recordB;  // Compile error. These records don't have the same type. So we can not assign one record to another.

  // The names of positional fields in a record type are are part of the record's type definition, or its shape. Positional fields only depends upon position of field. Two records of same signature (with or without named) positional fields with different names have same types.
  (int a, int b) recordC = (1, 2);
  (int x, int y) recordD = (3, 4);
  recordC = recordD;    // Now it's okay because due to positional fields the type of both records is same.

  // Record Equality.
  // Two records are equal if they have the same shape (set of fields), and their corresponding fields have the same values.
  (int a, int b, int c) rec1 = (1, 2, 5);
  (int x, int y, int z) rec2 = (1, 2, 5);
  print(rec1 == rec2);   
  // True, because both records have same shape(name of fileds donot matter as they are positional fields) and same values.
  
  ({int a, int b, int c}) rec3 = (a: 1, b: 2, c: 7);
  ({int x, int y, int z}) rec4 = (x: 1, y: 2, z: 7);
  print(rec3 == rec4);  
  // False, because both records have same values but different shape. As name of the filed is also the part of shape.
  // Since named field order is not part of a record's shape, the order of named fields does not affect equality.
  var rec5 = (b: 1, a: 2, c: 7);
  print(rec3 == rec5);
  // False, because values are not same.

  var rec6 = (b: 2, a: 1, c: 7);
  print(rec3 == rec6);
  // True, because now the shape and values of both records are same.
  
  // Part 4: Multiple types return from function.
  // swap function is called.
  print(swap(('Waqar Zaka', 22)));
  (String, int) record5 = ('', 10);
  swap(record5);
  print(swap(koo(3, 'Zeeshan')));

  // studentInfo function is called.
  var studentRecord = studentInfo({'name':'Usman', 'userID':'SD1245', 'rollNo':45});
  print(studentRecord);      
  
}

// If we want to return multiple type of values from function so we can use record as RDT. In actual only single type value is returning from function which is record. But record is composit type.
(num, String) foo(){
  return (20, 'Ali');
}
//or
(int, String) soo(String name, int age){
  return (age, name);
}
//or
(String, int) koo(int age, String name){
  return (name, age);
}

// swap functions which return record and take record in parameter.
(int, String) swap((String, int) rec){
  var (a, b) = rec;  
  return (b, a);
  // pattern matching and destructuring concept applied here which we will discuss below.
}

// Another function which return multiple types. Although function always retun a single type value like here record. But record itself is combination of different types.
({String name, int rollNo}) studentInfo(Map<String, dynamic> map){
  return (name: map['name'], rollNo: map['rollNo']);
}

