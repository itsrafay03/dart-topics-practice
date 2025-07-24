// https://dart.dev/language/mixins
// Now we have another intresting concept of mixin that as we know mixin act as a parent of the class who mix it.
// But as parent class in inheritance there is constructor of parent class which caleed implicitely if it is default or if it is parameterized constructor then we call it from 'super' in child concrete class so that we can give values of it's parameters.
// Now as we know that mixin have no constructors. So if we want to access the mixin members in the constructor of a class who mix the mixin, so that we can use the mixin members in parameter of child constructor and give the values of mixin members when object of subclass is created.
// For that we have 2 ways as below:

// Mixin with 2 datamembers and 1 member function.
mixin CarDriver {
  String? carName;
  int? speed;

  void experties() {}
}

// Parent class of Student class.
class Human {}

// Student class who extends Human class and mix with CarDriver mixin.
class Student extends Human with CarDriver {
  // datamember of Student class.
  String studentName;

  // 1st way: Override the members of mixin in thic class, it will give you setters/getters of the members of mixin as given below. Then use them in constructor or you can give them default value.




  // 1sy way.
  Student({required this.studentName, carName = 'suzuki', speed}) {
    carName = carName;
    speed = speed;
  }

  // 2nd way.
  // Student(
  //     {required this.studentName, required String carName, required int speed})
  //     : super() {
  //   this.carName = carName;
  //   this.speed = speed;
  // }
}

// main function to execute code.
void main(List<String> args) {
  Student student = Student(studentName: 'Ali', carName: 'Porche', speed: 20);
  print(student.studentName);
  print(student.carName);
  student.carName = 'Bugatti';
  print(student.carName);
  print(student.speed);
}
