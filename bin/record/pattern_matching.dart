// This file is made to understand the Pattern matching in Dart. Sir teach this topic from offical docs: https://dart.dev/language/patterns
// Patterns are a new syntactic category in the Dart language, like statements and expressions. A pattern represents the shape of a set of values that it may match against actual values.
// Like in previous topic we see that actual value is record and to destructure it we have to define a pattern which should be match with actual value otherwise it will not destructure.
// var (a, b) = (3, 4); In this var(a,b) is a pattern and (3, 4) is actual value. The pattern should match the shape of actual value.
// The shape of pattern check wether a given value Has a certain shape. Is a certain constant. Is equal to something else. Has a certain type.
// In this file sir practice the code form the offical docs so let's start.

// main function.
import 'dart:ffi';

void main(List<String> args) {
  // Constant Pattern Matching: In constant pattern matches the value is equal to the pattern's constant which is a literal constant.
  int number = 1;
  switch (number) {
    // Constant pattern matches if 1 == number.
    case 1:
      print('one');
    case 2:
      print('two');
    default:
      print('No match');
  }

  // or switch as expression:
  var value =
      switch (number) { 1 => 'one', 2 => 'two', 3 => 'three', _ => 'No match' };
  print(value);

  // Variable Pattern Matching:
  const a = 'a';
  const b = 'b';
  // In switch expression if we put {'a', 'b'}, ['a'], [b], ['a', 'c'], [a, a] it will no match because of shape mismatch. But if we put [a, b] or ['a', 'b'] it will match.
  switch ([a, b]) {
    // List pattern [a, b] matches obj first if obj is a list, then it has two fields, then if its fields match the constant subpatterns 'a' and 'b'.
    case [a, b]:
      print('$a, $b');
    default:
      print("No Match");
  }

  // Destructuring: When an object and pattern match, the pattern can then access the object's data and extract it in parts and then destructures the object. As we have seen in previous file.
  var numList = [1, 2, 3];
  // List pattern [a, b, c] destructures the three elements from numList, and assigns them to new variables.
  var [c, d, e] = numList;
  // Here we destructure List type as we have destructure record and class type in previous file.
  print(c + d + e);

  // You can nest any kind of pattern inside a destructuring pattern.
  // ['a' || 'b', var c] means it is a list of exactly 2 elements which has 'a' or 'b' at it's first element, if so then destructure this list and store it's second elemnt in 'c' variable.
  switch (['b', 'x']) {
    case ['a' || 'b', var c]:
      print('c is $c');
    case ['c' || 'd' || 'e', var f]:
      print('f is $f');
    default:
      print('No match');
  }

  // Variable declaration: You can use a pattern variable declaration anywhere Dart allows local variable declaration. The pattern matches against the value on the right of the declaration. Once matched, it destructures the value and binds it to new local variables.
  // In this pattern this is a record in which 1st field is a String and 2nd field is list in which there are 2 intigers elements.
  // Declares new variables a, b, and c.
  var (g, [h, i]) = ('str', [1, 2]);
  print('Name is $g with point is $h');

  // Variable assignment: Use a variable assignment pattern to swap the values of two variables without declaring a third temporary one.
  var (j, k) = ('Khan', 'Salman'); // destructuring.
  (k, j) = (j, k);
  print('$j $k');

  // Switch statement pattern matching: Every case clause contains a pattern. The values that a pattern destructures in a case become local variables. Their scope is only within the body of that case.
  // Switch as statement.
  switch ((3)) {
    // Matches if 1 == obj like constant pattern matching.
    case 1:
      print('one');

    // Matches if the value of obj is between the constant values of 'first' and 'last'.
    case >= 0 && <= 10:
      print('in range');

    // Matches if obj is a record with two fields, then assigns the fields to 'a' and 'b'.
    case (var a, var b):
      print('a = $a, b = $b');

    default:
      print('No match');
  }

  // Switch as an expression. It is  useful for having multiple cases share a body in switch expressions or statements.
  var isPrimary = switch (Color.green) {
    Color.red || Color.yellow || Color.blue => true,
    _ => false,
  };
  print(isPrimary);

  // Switch statements can have multiple cases share a body without using logical-or patterns, but they are still uniquely useful for allowing multiple cases to share a guard.
  // This is a pattern matching case with object destructuring. You're checking if shape is either a Square object that has a size field or a Circle object that has a size field. If matched, you're extracting (destructuring) the size field into a local variable 's' which use type inference var.
  // 'when s > 0' is a Guard Clause. This is an extra condition (guard) after pattern matching. If it is true then the case is properly matched and print the line.
  Shape shape = Circle(size: 25);
  switch (shape) {
    case Square(size: var s) || Circle(size: var s) when s > 0:
      print('Non-empty symmetric shape');
    default:
      print('No match');
  }

  // Guard clauses evaluate an arbitrary condition as part of a case, without exiting the switch if the condition is false (like using an if statement in the case body would cause).
  switch ((3, 5)) {
    case (int a, int b):
    if (a > b) print('First element greater');
    // If false, prints nothing and exits the switch.
    // Instead of writing separate if statement we can do this check by using gaurded clause as below.
    case (int a, int b) when a > b:
      // If false, prints nothing but proceeds to next case.
      print('First element greater');
    case (int a, int b) when a < b:
      print('First element not greater');
    // The fix of this dead code is to comment or remove 1st case.  
  }

  // For and for-in loops: You can use patterns in for and for-in loops to iterate-over and destructure values in a collection.
  Map<String, int> map = {'a': 23, 'b': 100};
  print(map.entries);
  // As we have for-in loop here so it will iterate through each entry of a map and for each iteration we destructure each element of map in (key: key, value: count) and print it.
  for (var MapEntry(key: key, value: count) in map.entries) {
    print('$key occured $count times');
  }
}

// Enum that is used in above code.
enum Color { red, yellow, blue, green, gray }

// Classes that is used in above code.
// It's batter to take size variable in each child class because if we take it in parent class then it will not be destructured from child class constructor.
class Shape {}

class Square extends Shape {
  final num size;

  Square({required this.size});
}

class Circle extends Shape {
  final num size;

  Circle({required this.size});
}
