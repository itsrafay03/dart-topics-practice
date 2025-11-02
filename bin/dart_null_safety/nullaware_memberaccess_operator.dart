// Null Aware or Null Safe member access operator(?.)
Student? student;
void main(List<String> args) {
  // student = Student();
  // student!.rollNo = 10;  // this is normal cas that student also refer to student object and we then access rollno by using ! operator to give true tasali.

  // student.rollNo = 3;    // Compiletime Error bec student is null and with null reference we are accessing rollNo to initilize value.
  // Even if in main function we do student = Student(), even then we got error bec student reference is Nullable(may have null or may have a reference of object).

  // So we can use ! operator but it will also give runtime error if student has not the reference of Student's object.
  // student!.rollNo = 4;

  // So in this case we will use Null aware or Null safe Member access operator(?.)
  // if student refer to Student object then it will access rollNo and it's assigned value otherwise if student is null then the complier will stop at ?. and
  // before that there is student ref which is refering to nothing means null so it will return null as return value.
  student?.rollNo = 5;
  print(student?.rollNo); // print null.
  print(student?.study()); // print null.

  student = Student();
  student?.rollNo = 7;
  print(student
      ?.rollNo); // as student refer to Student object so roll no of that student object is now 7.

  var st1 = Student();
  print(st1.study());

  var x = Student();
  print(x.study);
  print(x.rollNo);

  Student ss;
  // print(ss);
  // print(ss.runtimeType);
  ss = Student(); 
  print(ss.runtimeType);
  print(ss);
  print(ss.study());
}

class Student {
  int rollNo = 10;
  String name = 'Ali';
  String adddress = 'bwp';

  String study() {
    return 'I am studing';
  }
}
