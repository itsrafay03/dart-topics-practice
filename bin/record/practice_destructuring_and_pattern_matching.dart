// This file is to solve that practice questions of pattern matching and destructuring from ChatGpt.

void main(List<String> args) {
  // Q1: Create a record (10, 'Ali') and destructure it into id and name variables. Print both values.
  var (id, name) = (10, 'Ali');
  // or
  var record1 = (10, 'Ali');
  var (rollNo, nam) = (10, 'Ali');
  print('id: $id, rollNo: $rollNo');

  // Q2: Create a named record (name: 'Sara', age: 25) and destructure it into variables n and a. Print them.
  var (name: n, age: a) = (name: 'Sara', age: 25);
  //or
  var record2 = (name: 'Sara', age: 25);
  // var (:name, :age) = record2;

  // Q3: Write a function that returns (int, String). In main(), destructure its result and print it.
  var (noOfStudents, departmentName) =
      departInfo(departName: 'Computer Science', studentsNo: 2598);
  print('$departmentName have $noOfStudents students.');

  // Q4: Destructure (100, 'Apple') using final and try to change the variables. Observe the result.
  final (noOfFruits, nameOfFruite) = (100, 'Apple');
  // noOfFruits = 200;  // Error: The final variable 'noOfFruits' can only be set once.

  // Q5:  Use a switch to pattern match a record like (5, 10) and print both values using destructuring.
  // To make the when clauses effective, you need to place the more specific patterns (those with when clauses) before the more general patterns.
  // The switch evaluates case patterns from top to bottom. The first case pattern that fully matches the switch expression is executed. Once a match is found and its corresponding code block is executed, the switch statement exits immediately. It does not continue to check subsequent case statements, even if they would also technically match.
  switch ((2, 5)) {
    // constant matching.
    case 1:
      print("It's one");
      break;
    // variable matching.
    case (2 || 3, var s):
      print('Second element of record is $s');
    case (int a, int b) when a > b:
      print('$a > $b');
    case (int a, int b) when b > a:
      print("$b > $a");
    case (int a, int b):
      print('First Number is $a and second number is $b');
    default:
      print('No Match found.');
  }

  // Q6: Given var data = [1, 2, 3];, match only the first two elements using list pattern and ignore the third.
  // To ignore 3rd element use '_'.
  var data = [1, 2, 3];
  switch (data) {
    case [int a, int b,_]:
      print('$a, $b');
    default:
      print('No match found.');
  }

  // Q7: Create a class Person(name, age). Create an object and destructure it using pattern matching to get name and age.
  var Person(:nameofPerson, :ageOfPerson) = Person('Waqar Zaka', 32);
  print("$nameofPerson is $ageOfPerson years old.");
  // or
  // var Person(:ageOfPerson, :nameofPerson) = Person('Ali Khan', 45);

  // Q8: Make two classes: Square(size) and Circle(size). Match either object using || pattern and print the size.
  Shape shape = Square(size: 10);
  switch (shape) {
    case Square(size: var z) || Circle(size: var z) when z > 0:
      print("Size is $z");
      break;
    default:
      print("No match found.");
  }

  // Q9: Match a record (score, maxScore) and print only if score > 50 using when.
  switch ((200, 1299)) {
    case (int score, num maxScore) when score > 50:
      print("Score is $score");
  }

  // Q10:  Create a record like ('Ali', (23, 'Lahore')). Destructure to get name, age, and city.
  var record3 = ('Ali', (23, 'Lahore'));
  var (nickName, (points, area)) = record3;
  print('$nickName lives in $area. He has $points points in game.');

}

(int, String) departInfo({String departName = 'abc', int studentsNo = 0}) {
  return (studentsNo, departName);
}

class Person {
  String nameofPerson;
  int ageOfPerson;

  Person(this.nameofPerson, this.ageOfPerson);
}

class Shape {}

class Square extends Shape {
  final num size;
  Square({required this.size});
}

class Circle extends Shape {
  final num size;
  Circle({required this.size});
}
