// Global variables:
import 'dart:math';

int a = 10;
num b = 2.44;
double c = 5.67;
String d = 'Ali is ';
String e = "my friend";
String f = """Ali is well
and you are shell.""";
bool g = true;
void h =
    10; // It can be declare but It will give compile time error when we are trying to access h.

//print(a);  // needs a function body to execute.

void main() {
  print(a);
  print(f);
  //print(h); // As the D.T of h is void so it will not create any memory container in memory so that's why 10 has no place to store in h and it will give compile time error when we are trying to print it.
  String i = "$d my friend and he is $a years old.";
  print(i);
  print("The answer is ${b / c * 40 + b}");
  // when write two String literals togeather then don't use + concatenation operator.
  String j = "Waqar" ' Zaka';
  print(j);
  print("Welcome" ' to' " Pakistan.");
  // Use concatination operator when combaining two variables togeather.
  print(j + e);

  // Print emoji or charracters by using their uni-codes in string lateral and \u.
  print("\ufc3d");
  print("\u{1f44f}");

  // int ddd = pi as int;
  int ddd = pi.toInt();
  print(ddd.runtimeType);

  // Assert.
  assert(20 > 5);

  // Try Catch Block.
  var value = 3;
  try {
    assert(3 > 20);
    3 > 20 ? print("Yes") : print("No"); // Ternary(Conditional) operator.
  } catch (e) {
    print("In Catch Block");
  }

  infiniteLoop();
}

class University {
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

// Use of Never
Never infiniteLoop() {
  while (true) {
    print("Yes");
  }
}
