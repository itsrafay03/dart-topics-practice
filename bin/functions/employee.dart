// Employee class for use in Dynamic Function Execution class.

// In Dart (since null safety), every non-nullable field must be initialized:
// At the point of declaration, or In the constructor before the object is fully created.
// You're using this.name in the constructor that tells Dart: "This field will definitely get a value when the object is created"
// therefore, the field is safely initialized, and Dart does not throw an error.

class Employee {
  String name;
  int age;
  double salary;
  int scale;
  Employee({
    required this.name,
    required this.age,
    required this.salary,
    required this.scale,
  });

  @override
  String toString() {
    return "Name: $name, Age: $age, Salary: $salary, Scale: $scale\n";    
  } // Here we use '\n' at end of line to print each element from list of employee in separate line.
}
