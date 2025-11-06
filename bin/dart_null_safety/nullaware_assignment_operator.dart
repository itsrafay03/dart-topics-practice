// Null Aware Assignment Operator(??=). It works like if condition of Singleton in Java.
// It is used to assign a value to a variable only if that variable is currently null.
// variable ??= value;
// This means: "If variable is null, then assign value to it, otherwise not."

void main(List<String> args) {
// Null Aware Assignment Operator(??=) is used when Setting a Default Value
  int? count;
  count ??= 10;
  print(count); // Output: 10

  count ??= 20;
  print(count); // Output: 10 (because count is no longer null)
}

// Singelton Design Pattern.
class DB {
  static DB? _instance;
  DB._internal();

  static DB getInstance() {
    return _instance ??= DB._internal();
  }
}
