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
  void noOfWheels(int numberofWheels) {
    if (numberofWheels >= 4) {
      print('Done.');
    } else {
      print('Wheels are less.');
    }
  }
}

// 2) Base
base class Teacher {
  void teachingSubject(String subjectName) {
    print('Subject is $subjectName');
  }
}

// 3) Interface
interface class Animal {
  // Interface class can have concrete methods.
  void hunting() {
    print('Hunting for food');
  }
  // If class has simple interface modiifier then it has only concrete methods no abstract methods.
  // If class has interface and abstract both modifiers then due to abstarct we can have abstract methods in the class.
}

// 4) Abstract Interface
abstract interface class ICricketPlayer {
  // abstract interface class can have concrete methods due to interface modifier.
  void batting() {
    print('Oppner');
  }

  // abstract interface class can have abstract methods due to abstract modifier.
  void fielding();
  bool toss(String side);
}

// 5) Final
final class Lamborghini {
  // final class can have only concrete methods.
  void tuneing() {
    print('Lamborghini is ready to go');
  }

  // final class can not have abstract methods.
  // void burnout();   // show error
  // bool drifting();   // show error
}

// Final class can extends inside the same file.
base class FavouriteCar extends Lamborghini {}

// Final class can implements inside the same file.
final class MyCar implements Lamborghini {
  @override
  void tuneing() {
    // TODO: implement tuneing
  }
}

// 6) Sealed
sealed class University {
  // It can have abstract methods.
  void feeStructure();
  // It can have concrete methods.
  void admissions() {}
}

