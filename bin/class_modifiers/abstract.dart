import 'class_modifiers.dart';
// Use of class modifier: Abstract
// No Object because it is not a concrete class. only abstarct class has it's object in it's child class.
// Can be extends or implements.
// Can have both abstract and concrete methods.

// Vehicle vehicle = Vehicle();   // Error that object of Abstrct class can't be constructed.

// We can extends Vehicle class in another file and must override abstract methods.
class Car extends Vehicle {
  @override
  void speed(int metersPerHour) {
    print('Speed is $metersPerHour');
  }
} 

// We can implements Vehicle class in another file and must override all it's methods.
class SportsCar implements Vehicle {
  @override
  void noOfWheels(int numberofWheels) {
    // TODO: implement noOfWheels
  }

  @override
  void speed(int metersPerHour) {
    // TODO: implement speed
  }
}
