// Cascade operator(..) it work same as Builder design pattern in Java.
// That we can only access instance members by using them with object reference.

Student? s;
void main(List<String> args) {
  Student stu = Student();
  // in java we do like this to access data members of class, means we write stu again and again.
  // stu.rollNo = 2;
  // stu.name = 'Ali';
  // stu.adddress = 'Bwp';

  // But in dart we use cascade operator(..) which work same as Builder in java means we can access all members of class by writing reference only one time.
  stu
    ..rollNo = 2
    ..name = 'Ali'
    //..age = 3          // As age is static so not access by cascade operator with object of Student.
    ..adddress = 'Bwp';

  Student.age = 33; // The static members is only accessed by class name.

  // We can also access members directly with Consturctor using cascade operatorr.
  // Also like Builder we can access some or all members of class at a time.
  Student student = Student()
    ..name = 'Wasay'
    ..rollNo = 7
    ..rollNo = 10
    ..rollNo = 99;
  print("${student.name} with rollNo ${student.rollNo}");

  // Null Aware or Null Safe Cascade operator(?..)

  // But if the reference to object of class is nullable then we have to use Null safe operator before cascade operator to avoid from runtime error. We can also use ! assertion operator but if student refer null it will give run time error.
  // s
  //   !..rollNo
  //   ..name
  //   ..adddress;

  // s
  //   ?..name = 'Wasay'
  //   ..adddress = 'Lhr'
  //   ..rollNo = 34;

  // print(s?..rollNo); // It will give null as s was Null so execution stops at ? and before it there is s which is null so it give us null.

  // Now it is correct.
  s = Student();
  s
    ?..name = 'Wasay'
    ..adddress = 'Lhr'
    ..rollNo = 34;

  print(s?..rollNo); // It will print 'Instance of 'Student''  as this entire expression of cascade operator returning s, which is object/instance of Student.
  print(s?.rollNo); // Now it give us 34.
}

class Student {
  static num age = 20;
  int rollNo = 10;
  String name = 'Ali';
  String adddress = 'bwp';
}
