// There are 2 types of constants in Dart.
// Compile time constant (const)
// Run time constant (final)

void main(List<String> args){
// Constant Strict type decleration.
  // Compile time constants with const keyword.
  // const num aa;   // Error as it is compile time constant so must be initilized when declare.
  const num number = 27;
  // number = 111;   // Error: Cannot modify a constant. It will only initilize once.
  const bool isPresent = true;
  print(number.runtimeType);

  // Runtime constants with final keyword.
  final Student st1;  // No error as it is runtime constant so it can be declare without initilizing value 
  // as it will be initilize during runtime.
  final Student student = Student();
  // student = Student();   // Error: Cannot modify a constant. It will only initilize once.
  final String string = String.fromCharCode(2);  // String only has named constructor in Dart.
  print(string.runtimeType);

// Constant Type inference.(No defining of D.T).
  // Compile time constants with const keyword.
  const digit = 27;
  const isAbsent = true;
  // isAbsent = 45.55;   // Error as in typeinference 1st D.T of reference can not be changed.
  // isAbsent = false;  // Error: Cannot modify a constant. It will only initilize once.
  print(digit.runtimeType);

  // Runtime constants with final keyword.
  final stu = Student();
  final str = String.fromCharCode(2);  // String only has named constructor in Dart.
  print(str.runtimeType);

}

class Student {}