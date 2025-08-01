// This file is to understand the pattern types. Sir teach this topic from offical docs https://dart.dev/language/pattern-types
//

void main(List<String> args) {
  // Logical-or
  var isPrimary = switch (Color.green) {
    Color.red || Color.yellow || Color.blue => true,
    _ => false,
  };
  print(isPrimary);
  // In above code there is no varible bounding.
  // Subpatterns in a logical-or pattern can bind variables, but the branches must define the same set of variables, because only one branch will be evaluated when the pattern matches. means:
  // When you use || in a pattern, if you're binding variables, you must bind the same variables with the same names and types in all branches. Like here we use 'var s'.
  var result = switch (Circle(size: 19)) {
    Square(size: var s) || Circle(size: var s) when s > 0 => s,
    _ => 0,
  };
  print(result);
  // In above if we put different variables names like s1 and s2 then Dart will say s1 and s2 are not the same set of variables, and it won’t know which variable to use in the result (s1 or s2) because only one branch executes, but both variables may not exist in every branch.

  // Logical-and
  // A pair of patterns separated by && matches only if both subpatterns match. If the left branch does not match, the right branch is not evaluated due to short circuting.
  // Subpatterns in a logical-and pattern can bind variables, but the variables in each subpattern must not overlap, because they will both be bound if the pattern matches.
  switch ((1, 2)) {
    // Error, both subpatterns attempt to bind 'b' so variables overlap.
    // case (var a, var b) && (var b, var c):
    // Change it like that:
    case (var a, var b) && (var c, var d):
      print('$a, $b, $c, $d');
  }

  // Relational:
  // Relational patterns compare the matched numeric value to a given constant using any of the equality or relational operators: ==, !=, <, >, <=, and >=.
  asciiCharType(23);

  // Cast:
  // A cast pattern lets you insert a type cast in the middle of destructuring, before passing the value to another subpattern.
  (num, Object) record = (10, 's');
  var (number as int, word as String) = record;
  print(word.runtimeType);

  // Null-check:
  String? maybeString = 'nullable with base type String';
  print("Runtype of maybeString is ${maybeString.runtimeType}");
  switch (maybeString) {
    case var s:
      print("Runtype of s is ${s.runtimeType}");
      break;
    case null:
      print('maybeString is null');
    default:
      print('No match');
  }

  // Null-assert:
  List<String?> row = ['user', "Ali"];
  switch (row) {
    case ['user', var name!]:
      // 'name' is a non-nullable string here.
      // We use assertion operator with name because to prove that exception is not due to pattern matching but the actual cause of error is null.
      // So to fix the exception either give the name value instead of null in list or do not use assertion operator(!) with name variable.
      print('Name is $name');
  }

  //To eliminate null values from variable declaration patterns, use the null-assert pattern.
  (int?, int?) position = (2, 3);
  var (x!, y!) = position;
  print("X is $x, Y is $y");

  // Constant:
  // List or map pattern:
  // case [a, b]:
  // List or map literal:
  // case const [a, b]:

  // Variable:
  // Variable patterns bind new variables to values that have been matched or destructured. The variables are in scope in a region of code that is only reachable when the pattern has matched.
  switch ((1, 2)) {
    // 'var a' and 'var b' are variable patterns that bind to 1 and 2, respectively.
    case (var a, var b):
    // 'a' and 'b' are in scope in the case body.
  }

  // A pattern named _ is a wildcard. It's useful as a placeholder in places where you need a subpattern in order to destructure later positional values.
  var list = [1, 2, 3];
  var [_, two, _] = list;
  // A wildcard name with a type annotation is useful when you want to test a value's type but not bind the value to a name.
  switch (record) {
    case (int _, String _):
      print('First field is int and second is String.');
  }

  // Identifier:
  // Identifier patterns may behave like a constant pattern or like a variable pattern, depending on the context where they appear.

  // Parenthesized:
  // Like parenthesized expressions, parentheses in a pattern let you control pattern precedence and insert a lower-precedence pattern where a higher precedence one is expected.
//   bool xx, yy, zz;
//   xx = yy = true;
//   zz = false;
//   String answer = switch ((xx, yy, zz)) {
//     xx || yy => 'matches true',
//     xx || yy && zz => 'matches true',
//     xx || (yy && zz) => 'matches true',
//     // `x || y && z` is the same thing as `x || (y && z)`.
//     (xx || yy) && zz => 'matches nothing',
//     _ => 'no match'
//   };
//   print(answer);

  // List
  const a = 'a';
  const b = 'b';
  switch ([a, b]) {
    // List pattern [a, b] matches obj first if obj is a list with two fields,
    // then if its fields match the constant subpatterns 'a' and 'b'.
    case [a, b]:
      print('$a, $b');
    default:
      print('No match');
  }

  // You can, however, use a rest element as a place holder to account for any number of elements in a list. This is pattern matching.
  var [m, n, ...rest, r, s] = [1, 2, 3, 4, 5, 6, 7];
  print('value of r is $r');
  print(rest);
  
  // The few last things are discussed in the offical docs, so see it from there. Because those things are already discussed.

}

// enum for Logical-or pattern.
enum Color {
  red,
  yellow,
  green,
  blue,
  pink,
}

// classes for Logical-or pattern.
class Shape {}

class Square extends Shape {
  final num size;
  Square({required this.size});
}

class Circle extends Shape {
  final num size;
  Circle({required this.size});
}

// function for relational pattern.
String asciiCharType(int char) {
  const space = 32;
  const zero = 48;
  const nine = 57;

  return switch (char) {
    < space => 'control',
    == space => 'space',
    > space && < zero => 'punctuation',
    >= zero && <= nine => 'digit',
    _ => 'not a character'
  };
}
