// num x;    // Error as it is nullsafe but we provided null in x.
num? a, b, c; // Global variables must be nullable if not initilized.
num d =
    10; // If Global variables are initilized then no need of nullable as they have their value.
String e = 'Khan';

class Student {
  // int rollNo;   // Error as it is nullsafe but we provided null in rollNo.
  String name = 'Ali';
  String?
      address; // By default datamembers are nullsafe but to make them nullable we use '?'.

  void study() {
    bool isPresent; // Here in local scope of function variables can be null.
    int presents; // Means there is no nullsafety in this scope.
  }
}

void main(List<String> arguments) {
  Student
      student; // Here the variables can be null as in local scope of function variables can be null.
  int presents; // Means there is no nullsafety in this scope of main function.

  // Discussed in last of the file.
  print("soooooooooo");
  int? number;
  int? value;
  print(number.runtimeType);
  print(value
      .runtimeType); // Here value type is showing null because as no value is initilized to
  //value so compiler can't infer any type for value so it give it a default
  //type Null. Because in Dart everything is object and if a variable has no
  //initial value then it's default value is null.
  value = number;
  print(value
      .runtimeType); // Still the type of value is null as the value initilize to it is int nullalbe which is currently null.

  // The type of value is intnullable so we can initilize null or int value to value.
  value = null;
  value = 8;
  print(value.runtimeType);
}

mixin foo {
  // Even in Mixin this nullsafety is same as that of class.
  int? a;
}

// We can not assign nullable variable to a nullsafe variable.
num? g;
// num h = g;   // Error.
// We can do this by use of Assertion operator '!' with nullable variable.
num i = g!;

// Similarly

String? student;
// String name = student;  // Error as nullable variable assign to nullsafe variable.
String name = student!; // Assertion operator.

// Another intresting concept.

// var? x;  // Error
int? z;    // No Error
// Reason:
// The first statement, var? x; gives an error because 'var' cannot be combined with
// a nullable type indicator (?). Dart infers the type automatically when using var,
// so it already decides whether the variable can hold null based on the value assigned.
// Adding ? to var is redundant, and thus causes an error.
// var x; by itself is valid and means x can hold any value, including null (default type dynamic).
// If you want x to be nullable and have a specific type, you need to declare it like this: int? x;, String? x;, etc.

// Summary
// var? is not allowed because var doesn’t combine with the nullable operator (?).
// Type? (like int?) is the correct way to declare a nullable variable with a specific type.

// Another concept is discussed in last few lines of main function. This is the topic of type inference but we can discuss it here.
