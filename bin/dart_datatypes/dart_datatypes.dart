import 'dart:math';

int firstNum = 10;
// print(); we also can not use any global function out of the scope of any other function because the runable code is the one which is in the body of any function.
void main(List<String> arguments) {
  print('Let' 's start programming.');

// Basic Data types of Dart.
  num a = 20;
  num b = 2.345;
  int c = 35000;
  double d = 9.43;
  bool e = true;
  String f = 'Jamshaid'; // String with Single quotes.
  String g = "All is well"; // String with Double quotes.
  String h = '''In this case,    
  I don't think that is appropriate, as none of the articles
  for where ai is a word are particularly prominent, and 
  therefore a disambig page would be needed anyway. 
  I think the original split is appropriate, but would like
  to hear your reasoning. If I don't get a response in a day
  or two I will revert it, and move this comment to it's discussion page.
  HappyDog 02:00, 26 Jan 2004 (UTC)''';
  print(h);

  // void data type is also in Dart.
  void x;
  //  print(x);    // Here we get an error because we can not use void as a datatype of a variable as 
  // void is used a RDT for functions which return nothing. So when we declare variable 'x' with void it
  // actually donot declare any variable because void means “no value” and when we try to print 'x' it 
  // gives us error saying that what is 'x'?
  

  // String Interpolation:
  // We can use variables and expressions with the String Literals inside quotes with the use of '$' sign.
  String q = "$f is my friend and he is $a years old.";
  print('RollNo : $a, Annual Fee : ${c * 12}');
  print('Answer of b * d + a = ${b * d + a}');

  // To Concatinate two String literals we not need '+' operator to concatinate them as.
  String ss = "Samad " "Ahmad";
  print(ss);
  print('Ali ' 'Khan ' "Shb");
  
  // But to Concatinate two variables having String we must need '+' operator to concatinate them as.
  String firstName = "Rohan ";
  var secondName = "Khalid";
  print(firstName + secondName);

  // We can print the characters/emoji by giving their Unicodes as string literals in print function by using '\u'.
  print('\ufc2d');
  print('\u{1f44c}');
  String emoji = '\u1f44';
  print(emoji);

  print(pi); // pi is Global constant in dart. Also print is Global function in Dart.

  // Casting.
  double dd = 7.89;
  print(dd.runtimeType);
  // int ii = dd as int;   // It will give error because 'as' will check that if double is subtype of int. As they are two different D.T so they can not be cast by using 'as'.
  int iii = dd
      .toInt(); // other way to cast double to int. The toInt() will truncate value of double and make it int value.
  print(iii);

  // Use of Assert that is used for debugging that where the condition is not matched then in assert the execution will stop there.
  var onePoint = double.parse('1.1');
  assert(onePoint == 1.1);
  assert(20 > 5);

  print(3.14159.toStringAsFixed(2));
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');
  // Constant int and Strings.
  const constNum = 0;
  const constString = 'Usman Bhai';
  // constString = "Ali";   // Error as Constant variables can't be assigned a 2nd value.
  print(constString.runtimeType);

  // These are not a Constant int and Strings.
  // In these Dynamic D.T the type of variable will be fixed as the D.T of first value initilize to that variable.
  var number = 0;
  var stringValue = 'Usman Bhai';
  // stringValue = 33;    // Error as stringValue type is fixed as String.
  print(stringValue.runtimeType);

  // Handle Exceptiions in try-catch block.
  var hitpoint = 1;
  try {
    assert(hitpoint == 0);
  } catch (e) {
    print('Error.');
  }

  Work work =
      Work(); // When constructor called the members take space in memory and initilize their value as for 'd' the foo() function is called so when var d = foo(); is encountered during initialization, the foo() function is immediately executed and print 'aaa' in terminal.
}

void foo() {
  print('aaaa');
}

int a = 10;

class Work {
  int s = a;
  var d = foo();

  @override
  String toString() {
    return 'I am instance of Work class. \u{1f44c}';
  }
}

// Above are Global members so they can be accessible anywhere in this package in any class.

// Use of Never in Dart. As it is infinite loop so it returns never.
Never infiniteLoop() {
  while (true) {
    print('We are Back.');
  }
}
