// Collasing operator(??) is used to assign value to nullsafe variable.
// If nullable variable has value then ok otherwise the other given value will assign to the nullsafe variable.
// So we not need any ! or ? operator in it.

int? nullable;
// int nullsfe = nullable;    // Error as nullable variable can't be assign to nullsafe variable.
int nullsafe = nullable ?? 999;

num? sss = 45;
num aaa = sss ?? 999;

Student? s1, s2;
void main(List<String> args) {
  print(nullsafe); // So as nullable is having null so 999 assign to nullsafe.
  print(
      aaa); // As nullable variable sss is not null so it will assign to nullsafe variable aaa.

// Another example.
  print(1 ?? 3); // <-- Prints 1.
  print(12); // -- Prints 12.
  print(3);   // Now prints 3

  
  Student stu = s1 ?? s2!;
  // Although it will give Runtime error as s2 is also null but we give jhooti tasali.

}

class Student {
  String name = "Huzaifa Khan";
  int age = 22;
  num? rollNo = 999;

  String study() {
    return 'I am studying';
  }
}
