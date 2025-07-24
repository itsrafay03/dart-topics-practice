// This file has a code of previous file continued. As code was getting longer in record.dart file.

void main(List<String> args) {
  // Part 5: Destructuring.
  // Destructuring in record types refers to the process of extracting individual values from a record and assigning them to separate variables.
  // But this will be done through pattern matching, if pattern match then they will destructure otherwise not.
  // Destructuring of Positional fields records.
  // We use 'var' for type inference of variables name and age. The destructuring pattern on the left matches the positional record structure on the right, which is a record of two positional values: ('Java', 54). As record matched so the first value is assigned to name, and the second to age, with their types inferred based on the assigned values.
  var (name, age) = ('Java', 54);
  /* Equivalent to:
  var info = ('Java', 54);
  var name = info.$1;
  var age  = info.$2; */
  // We can use name and age as individual variables having their respective values.

  // Destructure record of positional fields which is returning from a fuction.
  var (digit, word) = foo();
  //or
  // var (int digit, String word) = foo();   // It's same like above.
  print(word); // Ali

  var info = ('Python', false, {2, 3, 4});
  // info is a record of positional fields, now it is destructure.
  var (langName, isEasy, setOfValues) = info;
  print(info.$3); // instead of this we can write below one because info record is destructured and it's 3rd field assign to the variable 'setOfValues'.
  print(setOfValues);

  // Destructuring of Named fields records.
  // We use colon':' for the destructuring of named fields of record. For destructuring of named filed record we use key value pairs. The key here is name of field and value is the variable name that we want for the field.
  // In named record destructuring, we use the pattern fieldName: variableName to extract values. The 3 named field record (name: 'Swift', company: 'Apple', duration: 12) is destructured into 3 variables n, c, and d.
  // Dart infers their types based on the assigned values, and var enables that inference.
  var (name: n, company: c, duration: d) =
      (name: 'Swift', company: 'Apple', duration: 12);
  print('Duration of $n is $d');

  // If we want the same variable names as the field names of record then we can simplify using (:fieldName, :fieldName).
  var (:languageName, :company, :duration) =
      (languageName: 'Swift', company: 'Apple', duration: 12);
  print(languageName);
  print(company);

  // Destructure record of named fields which is returning from a fuction.
  // As they are named fields so we can change their order according to fields name.
  var (:studentRollNo, :studentName) =
      studentInfo({'name': 'Devon Larat', 'address': 'Bwp city', 'rollNo': 29});
  print("$studentName rollNo is $studentRollNo");
  // Or we can do that:
  var data =
      studentInfo({'name': 'Iron Man', 'address': 'West city', 'rollNo': 71});
  var (studentName: identifier, studentRollNo: roll) = data;
  print("$identifier rollNo is $roll");


  // Part 6: Immutability of fields of record.
  // This is positional record destructuring with var → meaning variables are mutable.
  var (String place, int index) = ("UAE", 50);
  print(place); // UAE
  place = 'KSA';
  print(place); // KSA

  // This is named record destructuring with var → meaning variables are mutable.
  var (:region, :point) = (region: 'Pakistan', point: 100);
  print(region); // Pakistan
  region = 'Brazil';
  print(region); // Brazil

  // By default, variables created through record destructuring using var are mutable, meaning their values can be changed after assignment.
  // If you want the destructured variables to be immutable (i.e., their values can't be changed once assigned), use final instead of var.
  // This makes each variable a runtime constant, allowing the value to be assigned only once during execution.
  // Using final is especially useful for maintaining immutability, predictable and safe state in your code.

  // This is positional record destructuring with final → meaning variables are immutable.
  final (String places, int indexs) = ("UAE", 50);
  print(places); // UAE
  // places = 'KSA';  // Here we get error that final variable 'places' can only be set once.

  // This is named record destructuring with final → meaning variables are immutable.
  final (:regions, :points) = (regions: 'Pakistan', points: 100);
  print(regions); // Pakistan
  // regions = 'Brazil';  // The final variable 'regions' can only be set once.

  // You cannot use const directly for destructured variables because const requires values to be known at compile time, and destructuring often happens at runtime.
  // Dart only allows const with variables declared at compile-time and where the entire value must be known at compile time.
  // But Dart does not currently support this syntax:
  // const (a, b) = (1, 2); // ❌ Error: const destructuring is not allowed like this.
  // ✅ Instead, you can do:
  const record = (1, 2);
  final (first, second) = record; // ✅ Now this is fine.
  print(first);
  // first = 5;   // The final variable 'first' can only be set once.


  // Part 7: Destructuring of a class object using pattern matching.
  // Just like records, any composite type (i.e., a type made up of multiple fields or values) can be destructured using pattern matching in Dart. This includes classes — but only if they have a matching constructor and accessible fields.
  // Dart supports destructuring via class patterns, which allow you to extract individual fields from class instances.
  var size = Size(height: 100, width: 200);
  print(size);
  print(size.runtimeType);  // size, because it refer to the object of Size class.
  // For destructuring of object we have to use same rule like we are calling constructor, just in place of values use variables. 
  var Size(width: w, height: h) = size;
  print(w);
  // or.
  var Size(:height, :width) = Size(height: 190, width: 77);
  print("Height: $height, Width: $width");

  // Above we can change the value of variables as they are mutable due to 'var'. But now we will make them immutable by using 'final'.
  final Size(height:heig, width: wid) = Size(height: 24, width: 25);
  print("Height: $heig, Width: $wid");

}

// If we want to return multiple type of values from function so we can use record as RDT. In actual only single type value is returning from function which is record. But record is composit type.
(num, String) foo() {
  return (20, 'Ali');
}

// Another function which return multiple types. Although function always retun a single type value like here record. But record itself is combination of different types.
({String studentName, int studentRollNo}) studentInfo(
    Map<String, dynamic> map) {
  return (studentName: map['name'], studentRollNo: map['rollNo']);
}

// A simple class with 2 named fields in constructor.
class Size {
  double height;
  double width;
  Size({required this.height, required this.width});
}

// Types of Destructuring in Dart.
// 1. Variable Destructuring
// Uses var or final to extract values from records or patterns into new variables. Most commonly used with records and object patterns.
// var (a, b) = (1, 2); // a = 1, b = 2

// 2. Constant Pattern Destructuring
// Compares against existing constant values instead of binding variables. No new variable is declared.
// const expected = 5;
// switch (5) {
//   case expected: print('Matched'); // Matches if value equals expected
// }

// 3. Object Destructuring
// Extracts properties from objects using object patterns (e.g., class fields). Often used in switch or if-case statements.
// class Point {
//   final int x, y;
//   Point(this.x, this.y);
// }
// void main() {
//   var point = Point(3, 4);
//   switch (point) {
//     case Point(x: var a, y: var b): print('a=$a, b=$b');
//   }
// }

// 4. List/Array/Map Destructuring
// Extracts elements from a list using a list pattern.
// var [first, second] = [10, 20]; // first = 10, second = 20

// 'Records as simple data structures' is very infromative topic in offical documentation. It is not discussed here so also see it for once.
