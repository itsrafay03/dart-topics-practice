// This file is made to understand that In Dart, we can use the const keyword with a constructor if we want the object to be a compile-time constant.
// But for this: All fields of the class must be 'final' and the constructor itself must be marked with the 'const' keyword.
// Because Dart must guarantee immutability for any object created with const. 'const' means: The object is frozen at compile-time, It will never change in memory, and Dart may reuse the same instance in memory to save space.
// Dart enforces final fields and const constructors together so that objects created with const are guaranteed to be fully immutable and safe for compile-time reuse.

class Duration {
  // final Fields.
  final int hours;
  final int minutes;
  final int seconds;

  // const Constructor.
  const Duration({this.hours = 0, this.minutes = 0, this.seconds = 0});
}


// Another class of Person which voilates the rule.
class Person {
  // String name;   // not final field.
  // final int age;

  // const Person(this.name, this.age); // ❌ Error at constructor: not all fields are final
}

// Since name is not final, it could be changed later.
// That violates the promise of const being immutable.
// Therefore, Dart shows a compile-time error.