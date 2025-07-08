// This file is to understand the basic scope of members of file and class. Along with types of constructor of a class.

class Student {
  int _rollNo;
  String _name;

  // Below are the constructors only for public datamembers. int? rollNo and String? name
  // Below is normal constructor as that we made in Java.
  // Student(int r, String n){
  //   rollNo = r;
  //   name = n;
  // }

  // Above syntax of Constructor is long so we have a syntaxtical sugar of above constructor as following.
  // It show what ever the value pass to the constructor call, the value will directly assign to datamembers of class due to this.
  // Here we give the mandatory positional parameters to the Student constructor.
  // Student(this.rollNo, this.name);

  // Here we give the optional positional parameters to the Student constructor.
  // Student([this.rollNo, this.name]);

  // Here we give the required named parameters to the Student constructor.
  // Student({required this.rollNo, required this.name});

  // Below are the constructor only for private datamembers. int _rollNo and String _name
  // Now if we try to make Named parameter constructor for private data members then it will give error,
  // because the private datamembers cann't be expose to other file.
  // Here if we call the below constructor in another file we have to give named parameters which has parameters names same as private datamembers,
  // means private datamembers are exposed out of the file so it show error that it is not allowed.
  // Student({required this._rollNo, required this._name});
  // Student({this._rollNo, this._name});

  // Now if we remove required and Named parameter, then it will work correctly as below.
  // Because now they are not named parameters, they are positional parameters and they are not exposing outside the file with private datamembers name.
  // So it works correctly as now they are simple mandatory parameters.
  // Student(this._rollNo, this._name);

  // Now if we only want the Required Named parameters in constructors for private datamembers then for that we will use Initilization List.
  // After function Header the statements between : and ; is called Initilization List.
  // Student({required int rollNo, required String name})
  //     : _rollNo = rollNo,
  //       _name = name;

  // Now if we want Optional Default Named parameters in constructors for private datamembers, then we will remove Required and give them default values.
  Student({int rollNo = 12, String name = 'Rizwan'})
      : _rollNo = rollNo,
        _name = name;

  @override
  String toString() {
    return "RollNo: $_rollNo, Name: $_name";
  }
}

void foo(Student s) {
  s._rollNo;
  // Here we see that in Dart private means package(file) private(accessible in whole file).
  // As _age is private in Student class but it is accessible outside the class in same file. As we can see it is accessible in global foo() function outside the Student class.
  // It's reason is that class library developer made the file and classes inside the file. So obviously one file is specific to the certain classes which are common so it allow the members to be package private.
}
