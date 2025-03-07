// Global varibales or class datamembers are null safe variables.
// String a;   // Error as global variables and datamembers are nullsafe(can not be null). Make it nullable or initilize value.

int nullSafeNumber = 20; // Null safe variable.
String? nullAble; // Nullable variable.
// var? aa;   // Not allowed as var can be null or any other D.T so it is redudent.
Null x;

// We can't assign Nullable variabl to the Nullsafe variable as it will give compile time error..
String? nam;
// String name = nam;   // Error.

num lateVariable = 3; // Noo use of late here.
late num? lateInt;
late bool isSum;

Student? s1, s2, s3;

double? d1, d2;

void main(List<String> args) {
  // print(nullAble.runtimeType);
  // String c; // function local variable can be null.

  // String? nam;
  // // String name = nam!;  // Runtime error as nam is actually null,  ot initilized yat.
  // nam = "Helo World";
  // String name = nam!; // Now it's execute without error.

  // print(lateVariable);
  // // print(lateInt);  // Error as accessed before itilization.
  // lateInt = 23.32;
  // print("$lateInt and ${lateInt.runtimeType}");

  // bool? a;
  // // isSum = a;  // Compile time Error as late variable isSum is nullsafe so nullable value cannot be assign to it.

  // bool? b;
  // // isSum = b!; // Runtime Error as 'b' is null and here it is initilize to nullsafe late variable.

  // bool? c;
  // print(c);
  // c = false;
  // isSum = c;

  // s1 = Student();
  // s1.age; // Although s1 has the reference of Student object but still age show Compile time error because
  // the s1 is nullable so what happen if there is null in s1 then from where age will access.
  // print(s1!.age); // We can use Assertion(!) operator to say that okay s1 refer to object.

  // print(s1?.name);
  // print(s1?.study());
  // // NullSafe or NullAware member access operator(?.) means if s1 refering to some
  // //object then it will access it's members and their value otherwise if s1 is not refering to any object
  // //then compiler will stop at (?.) and return the value of anything before this operator so as there
  // // is s1 before ?. which refer to nothing means null so we get null as return value.

  // s1 = Student();
  // s1?.rollNo = 101056;
  // print(s1?.name);
  // print(s1?.study()); // Now they will give proper value.

  // var ss;
  // print(ss);
  // print(ss.runtimeType);
  // ss = Student();
  // print(ss.runtimeType);
  // print(ss);
  // print(ss.study());

  // Cascade Operator.
  // Student stu = Student();
  // stu
  //   ..age = 17
  //   ..name = "Furqan"
  //   ..age = 19
  //   ..rollNo = 99
  //   ..study();
  // print("${stu.name} with age ${stu.age}");

  // // Cascade operator directly with Constructor call.
  // Student stu1 = Student()
  //   ..name = "Amir"
  //   ..age = 54;

  // // Here we use ! operator but the s2 is refer to nothing so we get Runtime Error.
  // // s2!
  // //   ..age = 120
  // //   ..name = "Mohsin";

  // // It will gives null as we use null safe operator before Cascade operator which will stop the execution at ?.. if s2 is empty.
  // s2
  //   ?..age = 30
  //   ..name = "Rizwan";
  // print(s2);
  // print(s2?.age);

  // // Now we assign object to s2.
  // s2 = Student();

  // // Cascade operator with Assertion Operstor(!)
  // s2!
  //   ..age = 120
  //   ..name = "Mohsin";
  // print(s2);
  // print(s2?.age);

  // // Cascade operator with NullSafe/NullAware Operstor(?)
  // s2
  //   ?..age = 120
  //   ..name = "Mohsin";
  // print(s2);
  // print(s2?.age);

  // s3 = Student()..age = 7;
  // print(s3?.age);
  // s3 ??= Student();

  // String? word1;
  // print(word1);
  // word1 ??= "India";
  // print(word1);

  String? me;
  print(me.runtimeType);

  double number1 = d1 ?? 99.99; // As d1 is null(not initilize).
  print(number1);
  d2 = 1.0;
  double number2 = d2 ?? 50.05; // As d2 has a value.
  print(number2);

  // Student stu = s1 ?? s2!;

  print(2 ?? 4);

  assert(stringify(2, 3) == '2 3',
      "Your stringify method returned '${stringify(2, 3)}' instead of '2 3'");
  print('Success!');

}

class RoughPractice {
// int b;   // Error as global variables and datamembers are nullsafe(can not be null). Make it nullable or initilize value.
  String s1 = "Khan";
  Object? o;

  // String name = nam;
  // Use of assertion operator.
  String name = nam!;

  void foo() {
    int number; // In function local scope there is no condition of nullsafe on function local varible.
    num numb;
  }
}

mixin foo {
  // Even in mixin the rules of nullsafety are same as that of clas.
  int? a;
}

class Student {
  String name = "Huzaifa Khan";
  int age = 22;
  num? rollNo = 999;

  String study() {
    return 'I am studying';
  }
}

class DB {
  static DB? _instance;
  DB._internal();

  static DB getInstance() {
    return _instance ??= DB._internal();
  }
}

String stringify(int x, int y) {
  return "$x $y";
}
