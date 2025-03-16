// There are 2 types of constants in Dart.
// Compile time constant (const)
// Run time constant (final)

import 'dart:async';

void main(List<String> args) {
  // Constant Strict type decleration.
  // Compile time constants with const keyword.
  // const num aa;   // Error as it is compile time constant so must be initilized when declare.
  const num number = 27;
  // number = 111;   // Error: Cannot modify a constant. It will only initilize once.
  const bool isPresent = true;
  print(number.runtimeType);

  // Runtime constants with final keyword.
  final Student
  st1; // No error as it is runtime constant so it can be declare without initilizing value
  // as it will be initilize during runtime.
  final Student student = Student();
  // student = Student();   // Error: Cannot modify a constant. It will only initilize once.
  final String string = String.fromCharCode(
    2,
  ); // String only has named constructor in Dart.
  print(string.runtimeType);

  // Constant Type inference.(No defining of D.T).
  // Compile time constants with const keyword.
  const digit = 27;
  const isAbsent = true;
  // isAbsent = 45.55;   // Error as in typeinference 1st D.T of reference can not be changed.
  // isAbsent = false;  // Error: Cannot modify a constant. It will only initilize once.
  print(digit.runtimeType);

  // Runtime constants with final keyword.
  final stu = Student();
  final str = String.fromCharCode(2); // String only has named constructor in Dart.
  print(str.runtimeType);
  final nickName = "Bobby";

  // Another case of Constants.
  var z = 20;   // z is a variable
  int x = 45;  // x is a variable
  // const int yy = z; // Error at z
  final int yyy = x;
// The reason is that the z and x are variable means their value be determined at runtime. So when we
// initilize const variable yy with variable it give error as const needs a compile time constant value
// so here it's like we are not giving any value to yy so it shows error Const variables must be initialized with a constant value.
// But the final variable yyy initilize with variable x because final is runtime constant so it will 
// determine it's value at runtime and as x is variable which will also determine it's value at run time 
// so at present at compile time it is not showing error. And at runtime yyy will also not show error as 
// at runtime what ever the value of x is initilize to yyy.

// Another special case of constants:

// Below in all 3 objects the list object is immutable due to const[]. We cannot add, remove, or modify elements in those lists. 
var foo = const [];
// const [] creates a compile-time constant empty list.
// Even though foo is var, the list it references is a const list, meaning its contents cannot be changed.
final bar = const [];
// Similar to foo, const [] creates a compile-time constant empty list.
// final ensures that bar can only be assigned once, and since it's assigned a const list, its content is also immutable.
const baz = [];
// This is equivalent to const baz = const [];
// It creates a compile-time constant empty list, and baz cannot be reassigned.
final bazz = [];
// The variable bazz would be final, and only assigned once.
// However, the list would be mutable.
final bazzz = const [];
// Then the variable baz is final, and the list is immutable.

// In conclusion:
// const makes the object immutable.
// final makes the variable immutable.
// If you want both the variable and the object to be immutable, use final with const.
  
// Although a final object cannot be modified, its fields can be changed. In comparison, a const object 
// and its fields cannot be changed: they're immutable. Because When you write const a = Student(), 
// Dart implicitly treats it as const a = const Student().
Student? stu1 = Student();  // Simple constructor call.
print(stu1.name); 
print(stu1.age); 
stu1..name = "Salman"..age ??= 19;
print(stu1.name); 
print(stu1.age);
print("----------------");
final Student stu2 = Student();
print(stu2.name); 
print(stu2.age);
stu2.name = "Waqas";
print(stu2.name); 
print(stu2.age);
// stu2 = Student();  // Error that final variable can be set only once.

// If we want to make a Class object immutable then we have to make 2 changes that:
// Make all fields final.
// Make a const constructor.
//Then you will able to make a const Class(), immutable class object. like define below a Teacher class.
print("--------------");
var tech1 = const Teacher(); 
print(tech1.name);
print(tech1.age);
// tech1.age = 34;  // Error as we cannot change values of immutable Class Object.

// We make class object as Runtime constant as object is made at runtime when constructor is called.

// const Student studentConst = Student(); // Class object cann't be compile time constant.
final Student studentFinal = Student();   // Class object must be runtime constant.
// Duration has all static constant fields so we can make it's object as compile time constant.
const Duration durationConst = Duration();  
final Duration durationFinal = Duration();  // It can also be runtime constant.
}

class Student {
  String name = "Ali";
  num? age;
}


class Teacher {
  final String name;
  final num? age;
   
  // Optional Default constructor. 
  const Teacher({this.name = "Ali", this.age = 3}); // Make the constructor const
}