// We made this Person class to use it as a parent class of Driver class.
// And we can see that how to call the constructor of parent class in the constructor of child class by using Initilization list.

class Person {
  final int _age;
  Person({required int age})
      : assert(age > 0),
        _age = age;
}
