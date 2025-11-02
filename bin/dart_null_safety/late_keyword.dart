// Late keyword is used before the datatype of variable, it means that this variable is although NullSafe but it will be initilize after some time.
// It will behave same as nullsafe variable for ? and !

// If we declare variable late and also initilize at the same time then there is obviously no use of late.
// late num lateVariable = 30;  // Unnecessary 'late' modifier lintent.
num lateVariable = 30;

late num tax; // Declare late global variable.

late int? price; // late variable but NullAble.

late int size;

void main(List<String> args) {
  // print(tax);   // Here we are accessing late variable without initilizing it so it will give error as it is nullsafe.
  tax = 70; // So here we initilize late variable and then print it.
  print(tax.runtimeType);
  print(tax);

  // print(price);   // Also CompileTime Error bec late variable should be initilize before use but although it is nullable but we have to initilize it before use.

  int? b;
  // size = b;  // Compiletime Error as b is nullable and also not initilize, but late variable is nullsafe to we can't assing nullable to nullsafe.

  int? c;
  // size = c!; // To finish error we can use assertion operator. But it will give Runtime error if we run program as c is null.

  int? d;
  print(d);
  d = 45;
  size = d; // Now it is perfect without error.
}
