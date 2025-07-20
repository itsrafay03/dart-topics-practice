// https://dart.dev/language/class-modifiers
// https://dart.dev/language/modifier-reference
// Above 2 links are of offical documentation about Class Modifiers topic.
// This file is about class/mixin modifiers and their practice.
// Class modifiers control how a class or mixin can be used, both from within its own library, and from outside the library where it's defined.

// 1) Abstract:
abstract class Vehicle {
  // Generally Abstract class have Abstract methods.
  void speed(int metersPerHour);

  // Abstract class can have concrete methods.
  void noOfWheels(int numberofWheels){
    if (numberofWheels >= 4) {
      print('Done.');
    } else {
      print('Wheels are less.');
    }
  }
}

// 2) Base
base class Teacher{
  void teachingSubject(String subjectName){
    print('Subject is $subjectName');
  }
}

// 3) Interface 
interface class Animal {
  // Interface class can have concrete methods.
  void hunting(){
    print('Hunting for food');
  }
  // If class has simple interface modiifier then it has only concrete methods no abstract methods.
  // If class has interface and abstract both modifiers then due to abstarct we can have abstract methods in the class.
}



